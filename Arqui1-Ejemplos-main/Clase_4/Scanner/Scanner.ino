#include <Wire.h>
 
void setup()
{
  //Iniciamos el puerto
  Wire.begin();

  //Iniciamos el serial
  Serial.begin(9600);
  // Esperamos al puerto serial
  while (!Serial);             
  //Enviamos el cartel a puerto serial.
  Serial.println("\nI2C Scanner");
}
 
 
void loop()
{
  byte error, address;
  int dispositivos = 0;
 
  Serial.println("Escaneando...");
 
  for(address = 1; address < 127; address++ )
  {
    //El scanner utiliza el valor de retorno de Write.endTransmisstion para ver
    //la direccion del dispositivo.
    Wire.beginTransmission(address);
    error = Wire.endTransmission();

    //Si no existen errores todo ok
    if (error == 0)
    {
      Serial.print("Dispositivo encontrado en la direccion 0x");
      if (address<16)
        Serial.print("0");
      Serial.print(address,HEX);
      Serial.println("  !");

      //Aumentamos el valor de los dispositivos encontrados.
      dispositivos++;
    }
    //Si existe este error solo declaramos que existe error en la siguiente direccion
    else if (error==4)
    {
      Serial.print("Error desconocido en la direccion 0x");
      if (address<16)
        Serial.print("0");
      Serial.println(address,HEX);
    }    
  }
  //En caso no se detecten dispositivos lanzar este cartel
  if (dispositivos == 0)
    Serial.println("Ningun dispositivo I2C encontrados! \n");
  else
    Serial.println("Hecho \n");

  //Esperamos 1 segundo para el proximo escaner
  delay(1000);           
}
