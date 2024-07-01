#include <ESP8266WiFi.h>
#include <ArduinoJson.h>

const char* ssid = "Arqui1_B1";
const char* password = "arqui2024";

// Simulación de datos de temperatura y humedad
float temperatura = 25.5;
float humedad = 50.0;

//Puerto que utilizara el servidor web
WiFiServer server(9000);

String datosRecibidos; // Variable para almacenar los datos recibidos desde el puerto serial

void setup() {
  Serial.begin(115200);
  delay(10);
  //Serial.println();
  //Serial.print("Conectando a ");
  //Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    //Serial.print(".");
  }
  //Serial.println("");
  //Serial.println("Conexión WiFi establecida");
  //Serial.println("Dirección IP: ");
  //Serial.println(WiFi.localIP());

  server.begin();
  //Serial.println("Servidor iniciado");
}

void loop() {
  WiFiClient client = server.available();
  if (!client) {
    if (Serial.available()) { // Verificar si hay datos disponibles en el puerto serial
      datosRecibidos = Serial.readStringUntil('\n'); // Leer los datos desde el puerto serial
      //Serial.print("Datos recibidos desde el puerto serial: ");
      //Serial.println(datosRecibidos);

      // Analizar la cadena CSV
      int comaIndex = datosRecibidos.indexOf(',');
      if (comaIndex != -1) {
        // Extraer la humedad y temperatura de la cadena CSV
        String humedadStr = datosRecibidos.substring(0, comaIndex);
        String temperaturaStr = datosRecibidos.substring(comaIndex + 1);
  
        // Convertir las cadenas a flotantes y almacenarlas en las variables correspondientes
        humedad = humedadStr.toFloat();
        temperatura = temperaturaStr.toFloat();
      }
      
    }
    return;
  }

  while(!client.available()){
    delay(1);
  }

  String request = client.readStringUntil('\r');
  //Serial.println("Petición HTTP: ");
  //Serial.println(request);
  client.flush();

  if (request.indexOf("/estadoLED") != -1) {
    handleEstadoLED(request,client);
  } else if (request.indexOf("/estadoMotor") != -1) {
    handleEstadoMotor(request,client);
  } else if (request.indexOf("/datos") != -1) {
    handleDatos(client);
  }

  delay(10);
  //Serial.println("Cliente desconectado");
}

void handleEstadoLED(String request,WiFiClient client) {
  int numero, estado;
  if (sscanf(request.c_str(), "GET /estadoLED?numero=%d&estado=%d", &numero, &estado) == 2) {
    // Aquí puedes realizar acciones basadas en los parámetros recibidos
    //Serial.print("Estado LED ");
    //Serial.print(numero);
    //Serial.print(": ");
    //Serial.println(estado);
    Serial.println("2,"+(String)numero+","+(String)estado);


    
    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: application/json");
    client.println("Access-Control-Allow-Origin: *");
    client.println("Connection: close");
    client.println();
    client.println("{\"status\":\"ok\"}");

    // Enviar datos por el puerto serial
    //Serial.print("Enviando datos desde el endpoint estadoLED: ");
    //Serial.println(request);
  }
}

void handleEstadoMotor(String request,WiFiClient client) {
  int estado;
  if (sscanf(request.c_str(), "GET /estadoMotor?estado=%d", &estado) == 1) {
    // Aquí puedes realizar acciones basadas en el estado del motor recibido
    //Serial.print("Estado del motor: ");
    //Serial.println(estado);

    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: application/json");
    client.println("Access-Control-Allow-Origin: *");
    client.println("Connection: close");
    client.println();
    client.println("{\"status\":\"ok\"}");

    // Enviar datos por el puerto serial
    //Serial.print("Enviando datos desde el endpoint estadoMotor: ");
    //Serial.println(request);
    Serial.println("1,"+(String)estado+",0");
  }
}

void handleDatos(WiFiClient client) {
  

  // Crear un objeto JSON
  StaticJsonDocument<200> doc;
  doc["temperatura"] = temperatura;
  doc["humedad"] = humedad;

  // Convertir el objeto JSON en una cadena
  String output;
  serializeJson(doc, output);

  // Enviar respuesta HTTP con el JSON
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: application/json");
  client.println("Access-Control-Allow-Origin: *");
  client.println("Connection: close");
  client.println();
  client.println(output);

  // Enviar datos por el puerto serial
  //Serial.print("Enviando datos desde el endpoint datos: ");
  //Serial.println(output);
}
