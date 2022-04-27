namespace Web_Application.Attributes
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DatabasePropertyAttribute : Attribute
    {
        public bool UsedInDatabase { get; private set; }

        /// <summary>
        /// Cria um atributo DatabasePropertyAttribute.
        /// </summary>
        /// <param name="usedInDatabase">Argumento utilizado para dizer se a propriedade faz parte do banco</param>
        public DatabasePropertyAttribute(bool usedInDatabase) => UsedInDatabase = usedInDatabase;

    }
}
