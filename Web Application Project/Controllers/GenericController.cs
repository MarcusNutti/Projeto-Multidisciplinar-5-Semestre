using Microsoft.AspNetCore.Mvc;
using System;
using System.Reflection;
using Web_Application.DAO;
using Web_Application.Models;
using Web_Application.Services;

namespace Web_Application.Controllers
{
    public abstract class GenericController<T> : Controller where T : BaseDatabaseModel
    {
        public GenericController()
        {
            SetDAO();
        }

        protected abstract void SetDAO();

        protected GenericDAO<T> DAO { get; set; }
        protected bool GeraProximoId { get; set; }

        protected string NomeViewIndex { get; set; } = "Index";
        protected string NomeViewForm { get; set; } = "Form";

        public virtual IActionResult Index()
        {
            try
            {
                var lista = DAO.List();
                return View(NomeViewIndex, lista);
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro<T>(erro,
                                          controller: GetType().Name,
                                          action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public virtual IActionResult Create()
        {
            try
            {
                ViewBag.Operacao = "I";
                var model = Activator.CreateInstance(typeof(T)) as T;
                PreencheDadosParaView("I", model);
                return View(NomeViewForm, model);
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro<T>(erro,
                                          controller: GetType().Name,
                                          action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public IActionResult Edit(int id)
        {
            try
            {
                ViewBag.Operacao = "A";

                var model = DAO.Consulta(id);
                if (model == null)
                    return RedirectToAction(NomeViewIndex);
                else
                {
                    PreencheDadosParaView("A", model);
                    return View(NomeViewForm, model);
                }
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       id: id,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public IActionResult Delete(int id)
        {
            try
            {
                DAO.Delete(id);
                return RedirectToAction(NomeViewIndex);
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       id: id,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public virtual IActionResult Save(T model, string Operacao)
        {
            try
            {
                ValidaDados(model, Operacao);
                if (ModelState.IsValid == false)
                {
                    ViewBag.Operacao = Operacao;
                    PreencheDadosParaView(Operacao, model);

                    return View(NomeViewForm, model);
                }
                else
                {
                    if (Operacao == "I")
                        DAO.Insert(model);
                    else
                        DAO.Update(model);

                    return RedirectToAction(NomeViewIndex);
                }
            }
            catch (Exception erro)
            {
                LogService.GeraLogErro(erro,
                                       model: model,
                                       controller: GetType().Name,
                                       action: MethodInfo.GetCurrentMethod()?.Name);

                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        protected virtual void PreencheDadosParaView(string Operacao, T model)
        {
            if (GeraProximoId && Operacao == "I")
                model.Id = DAO.ProximoId();
        }
        protected virtual void ValidaDados(T model, string operacao)
        {
            ModelState.Clear();

            if (operacao == "I" && DAO.Consulta(model.Id) != null)
                ModelState.AddModelError("Id", "Código já está em uso!");
            if (operacao == "A" && DAO.Consulta(model.Id) == null)
                ModelState.AddModelError("Id", "Este registro não existe!");
            if (model.Id <= 0)
                ModelState.AddModelError("Id", "Id inválido!");
        }
    }
}
