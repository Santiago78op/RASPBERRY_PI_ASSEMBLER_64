//Libreria del DHT 11
#include "DHT.h"

//Definicion del objeto de DHT
//Parametro 1 = Puerto donde esta conectado
//Parametro 2 = Tipo de sensor DHT11 o DHT22
DHT dht(12, DHT11);
 
// Definir el intervalo de tiempo en milisegundos para enviar el mensaje
const unsigned long intervalo = 10000; // 10 segundos

// Variable para almacenar el tiempo de la última vez que se envió el mensaje
unsigned long tiempoAnterior = 0;

//Definimos los led de los cuartos
#define LED1 6
#define LED2 7

// Definimos los pines donde tenemos conectadas las bobinas
#define IN1  8
#define IN2  9
#define IN3  10
#define IN4  11

//variable que almacena los datos recibidos
String datosRecibidos = "";

//Variables del motor steeper
bool activarMotor = false;
// Secuencia de pasos 
int paso [4][4] =
{
  {1, 0, 0, 0},
  {0, 1, 0, 0},
  {0, 0, 1, 0},
  {0, 0, 0, 1}
};



void setup() {
    dht.begin();
    Serial.begin(115200);

    // Todos los pines en modo salida
    pinMode(IN1, OUTPUT);
    pinMode(IN2, OUTPUT);
    pinMode(IN3, OUTPUT);
    pinMode(IN4, OUTPUT);

    //Definir los pines de los cuartos
    pinMode(LED1, OUTPUT);
    pinMode(LED2, OUTPUT);

    //Iniciamos apagado todo
    activarCuarto(1,0);
    activarCuarto(2,0);

   
    

}

void activarCuarto(int cuarto,int estado){
   switch(cuarto){
         case 1: digitalWrite(LED1,estado);
                break;
         case 2: digitalWrite(LED2,estado);
                break;
   }
}

void activarStepper(){
  if(activarMotor){
    for (int i = 0; i < 4; i++)
    {
      digitalWrite(IN1, paso[i][0]);
      digitalWrite(IN2, paso[i][1]);
      digitalWrite(IN3, paso[i][2]);
      digitalWrite(IN4, paso[i][3]);
      delay(10);
    }
  }
    
}

void loop() {
   // Obtener el tiempo actual en milisegundos
   unsigned long tiempoActual = millis();
  
   int h = dht.readHumidity();
   int t = dht.readTemperature();

   if (isnan(h) || isnan(t)) {
    //Serial.println("Falla al leer los datos del sensor de humedad y temperatura!");
    return;
   }

   // Verificar si ha pasado el intervalo de tiempo especificado
   if (tiempoActual - tiempoAnterior >= intervalo) {
      // Guardar el tiempo actual como el tiempo anterior para la próxima vez
      tiempoAnterior = tiempoActual;
  
      // Enviar el mensaje por el puerto serial
      Serial.println((String)h+","+(String)t+",");
      
   }

   //Verificamos los datos recibidos
   if (Serial.available()) { // Verificar si hay datos disponibles en el puerto serial
      datosRecibidos = Serial.readStringUntil('\n'); // Leer los datos desde el puerto serial
      //Serial.print("Datos recibidos desde el puerto serial: ");
      //Serial.println(datosRecibidos);

      // Analizar la cadena CSV
      int comaIndex1 = datosRecibidos.indexOf(',');
      int comaIndex2 = datosRecibidos.indexOf(',', comaIndex1 + 1);
      if (comaIndex1 != -1 && comaIndex2 != -1) {
        // Extraer la informacion de los datos
        String TIPO = datosRecibidos.substring(0, comaIndex1);
        String DATO_1 = datosRecibidos.substring(comaIndex1 + 1, comaIndex2);
        String DATO_2 = datosRecibidos.substring(comaIndex2 + 1);

                // Convertir las cadenas a flotantes y almacenarlas en las variables correspondientes
        int tipo_parametro = TIPO.toInt();
        int dato1 = DATO_1.toInt();
        int dato2 = DATO_2.toInt();

        switch(tipo_parametro){
              case 1: //Activar o desactivar motor
                      if(dato1 == 1){
                         activarMotor = true;
                      }else{
                         activarMotor = false;
                      }
                      break;
              case 2: activarCuarto(dato1,dato2);
                      break;
              case 3:
                      break;
        }


        
      }
   }

   //El motor stepper se mueve solo si esta activado
   activarStepper();
   
}
