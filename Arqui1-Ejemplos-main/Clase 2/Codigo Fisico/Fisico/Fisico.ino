const int LDRPin = A0;   //Pin del LDR
//Pin del LED 1
const int LED1 = 13;
//Pin del LED 2
const int LED2 = 7;
//Pin de GND
const int GND = 8;
//Resistencia para realizar una buena calibracion
const int calibracion = 1000;
//Variable para almacenar el valor de la resistencia
int valor;


void setup() 
{
   //Inicio del puerto serial
   Serial.begin(9600);
   //Seleccionamos el modo del pin
   pinMode(LED1,OUTPUT);
   pinMode(LED2,OUTPUT);
   pinMode(GND,OUTPUT);
   
   //Al iniciar que inicie apagado
   digitalWrite(LED1, LOW);
   digitalWrite(LED2, LOW);
   digitalWrite(GND, LOW);
}

void loop()
{
  //Vamos a leer el valor de la fotoresistencia
  valor = leerFoto();

  //Funcion para activar el LED
  iniciarLED(valor);
       
  //Imprimimos el valor
  Serial.println("Valor de fotoresistencia: " + String(valor));  
  //Esperamos para la proxima lectura
  delay(500);
}

//Funcion para la lectura del potenciometro
int leerFoto(){
  return calibracion - analogRead(LDRPin);
}

void iniciarLED(int valor){
     //Si hay luz este apagada.
     if(valor > 500){
        digitalWrite(LED1,HIGH);
        digitalWrite(LED2,HIGH);
     }
     //Si no hay luz que se encienda.
     else{
        digitalWrite(LED1,LOW);
        digitalWrite(LED2,LOW);
     }
}
