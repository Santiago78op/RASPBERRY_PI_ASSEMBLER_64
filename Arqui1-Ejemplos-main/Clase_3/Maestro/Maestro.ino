#include <Wire.h>

//Direccion del arduino esclavo
const byte I2C_SLAVE_ADDR = 0x01;

//Array de los pines que necesitamos
byte estado = 1;
int puerto = 2;

void setup() {
  //Iniciamos la comunicacion
  Wire.begin(I2C_SLAVE_ADDR);
  Serial.begin(9600);
  //Tiempo mientras sincroniza
  delay(3000);
}



void loop() {
  
   //Recorremos del 2 al 6 que son los puertos que utilizamos
   inicioTransmision();

   //Imprimimos un cartel
   Serial.println("PIN: "+String(puerto)+" Estado:" + String(estado));
    
   //Enviamos el pin que queremos encender
   Wire.write(puerto);
   puerto++;

   //Enviamos un byte, el estado
   Wire.write(estado);

   finTransmision();

   //Esperamos 1 segundo
   delay(1000);
     
   if(puerto == 7){
      puerto = 2;
      
      //Intercalamos el estado
      if(estado == 0){
        estado = 1;
      }else{
        estado = 0;
      }
   }
}

void inicioTransmision(){
     //Comenzamos la transmision
     Wire.beginTransmission(I2C_SLAVE_ADDR);
}

void finTransmision(){
     //Terminamos la transmision
     Serial.println(Wire.endTransmission(true));
}
