#include <WiFi.h>
#include <HTTPClient.h>
#include <math.h>

#define trigger_pin 5
#define Echo_pin 18
#define LED_BUILTIN 2

#define DEBUG_ULTRASSONICO 1
#define DEBUG_BROKER 1

#define VELOCIDADE_SOM_AR (0.0170145)

const char *ssid = "";
const char *password = "";
const char *hostname = "ESP32";

const char *orionAddressPath = "34.151.239.235:1026/v2";
const char *deviceID = "urn:ngsi-ld:entity:001";

unsigned int counter = 0;

long duration;
int distance;

HTTPClient http;

void setup()
{
    Serial.begin(9600);
    
    /* configuração dos pinos para o HC-SR04 */
    pinMode(trigger_pin, OUTPUT); // configure the trigger_pin(D9) as an Output
    pinMode(LED_BUILTIN, OUTPUT); // Set the LED (D13) pin as a digital output
    pinMode(Echo_pin, INPUT); // configure the Echo_pin(D11) as an Input

    setupWiFi (); /* conecta ao wi-fi */
    /* orionCreateEntity ();*/ /* cria entidade automaticamente no orion */
}

void setupWiFi()
{
    WiFi.mode(WIFI_STA);
    WiFi.setHostname(hostname);
    WiFi.begin(ssid, password);
    Serial.print("Connecting to WiFi ..");
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print('.');
        delay(50);
    }
    Serial.print("\n IP: " + WiFi.localIP());
    Serial.println(WiFi.localIP());
}

void ReadDistance() 
{
    /* inicia mensagem de leitura */
    //digitalWrite(trigger_pin, LOW);
    //delayMicroseconds(2);
    
    /* sinal para o HC-SR04 enviar os 8 pulsos de 40 kHz */
    digitalWrite(trigger_pin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigger_pin, LOW);
    
    duration = pulseIn(Echo_pin, HIGH); /* tempo de alta do pulso */
    distance= duration * VELOCIDADE_SOM_AR; /* conversão do tempo de alta na distância (cm) */
    
    #if (DEBUG_ULTRASSONICO)
    Serial.println("Distance: " + String(distance) + " cm");
    delay(1000);
    #endif
}

void loop()
{
    ReadDistance ();
    #if (DEBUG_ULTRASSONICO)
    Serial.println("Distancia= " + distance);
    #endif
  
    #if (DEBUG_BROKER)
    Serial.println("Updating data in orion...");
    #endif
    orionUpdate(deviceID, String(counter), String(++counter));
    #if (DEBUG_BROKER)
    Serial.println("Finished updating data in orion...");
    #endif
}

// Request Helper
void httpRequest(String path, String data)
{
    String payload = makeRequest(path, data);

    #if (DEBUG_BROKER)
    Serial.println("##[RESULT]## ==> " + payload);
    #endif
    
    if (!payload)
    {
        return;
    }
}

// Request Helper
String makeRequest(String path, String bodyRequest)
{
    String fullAddress = "http://" + String(orionAddressPath) + path;
    http.begin(fullAddress);

    #if (DEBUG_BROKER)
    Serial.println("Orion URI request: " + fullAddress);
    #endif

    http.addHeader("Content-Type", "application/json");
    http.addHeader("Accept", "application/json");
    http.addHeader("fiware-service", "helixiot");
    http.addHeader("fiware-servicepath", "/");

    #if (DEBUG_BROKER)
    Serial.println(bodyRequest);
    #endif
    
    int httpCode = http.POST(bodyRequest);
    
    #if (DEBUG_BROKER)
    Serial.println("POST feito!\nHTTP CODE= " + httpCode);
    if (httpCode < 0)
    {
        Serial.println("request error - " + httpCode);
        return "";
    }

    if (httpCode != HTTP_CODE_OK)
    {
        return "";
    }
    #endif

    http.end();
    return "";
}

/* Creating the device in the Helix Sandbox (plug&play) */
void orionCreateEntity()
{
    Serial.println("Creating " + String(deviceID) + " entity...");
    String bodyRequest = "{\"id\": \"" + String(deviceID) + "\", \"type\": \"iot\", \"temperature\": { \"value\": \"0\", \"type\": \"integer\"},\"humidity\": { \"value\": \"0\", \"type\": \"integer\"}}";
    httpRequest("/entities", bodyRequest);
}

/* Update Values in the Helix Sandbox */
void orionUpdate(String entityID, String temperature, String humidity)
{
    String bodyRequest = "{\"temperature\": { \"value\": \"" + temperature + "\", \"type\": \"float\"}, \"humidity\": { \"value\": \"" + humidity + "\", \"type\": \"float\"}}";
    String pathRequest = "/entities/" + entityID + "/attrs";
    httpRequest(pathRequest, bodyRequest);
}
