#include<Wire.h>
#include <LiquidCrystal_I2C.h>

const int puerto2 = 2;
const int puerto3 = 3;
const int puerto4 = 4;
const int puerto5 = 5;
const int puerto6 = 6;


//Crear objeto LCD
LiquidCrystal_I2C lcd(0x20,16,2);
LiquidCrystal_I2C lcd2(0x21,16,2);

long data = 0;
long response = 200;
const byte I2C_SLAVE_ADDR = 0x01;
int pinOut = 0;
int estado = 0;


void setup() {
  //Iniciamos los LCD
  lcd.init();
  lcd2.init();

  //Luz de fondo
  lcd.backlight();
  lcd2.backlight();

  //Colocamos el cursor en la columna 0 y fila 0
  lcd.setCursor(0,0);
  lcd2.setCursor(0,0);
  //Escribimos el mensaje
  lcd.print(" Temporizador! ");
  lcd2.print("              ");

  //Iniciar serial
  Serial.begin(9600);

  //Pines tipo OUTPUT
  pinMode(puerto2, OUTPUT);
  pinMode(puerto3, OUTPUT);
  pinMode(puerto4, OUTPUT);
  pinMode(puerto5, OUTPUT);
  pinMode(puerto6, OUTPUT);

  digitalWrite(puerto2,LOW);
  digitalWrite(puerto3,LOW);
  digitalWrite(puerto4,LOW);
  digitalWrite(puerto5,LOW);
  digitalWrite(puerto6,LOW);

  //Registrar eventos de cambio
  Wire.onReceive(receiveEvent);

  //Iniciamos la transmision
  //Unimos el dispositivo en el puerto 1
  Wire.begin(I2C_SLAVE_ADDR);
}

void loop() {
  //Limpiamos el cartel
  lcd2.clear();

  //Colocamos el cursor en fila y columna 0
  lcd2.setCursor(0,0);

  //Array del mensaje
  char Pin[12] = "PIN LED: ";
  Pin[9] = (pinOut + 48);
  lcd2.print(Pin);
  lcd2.setCursor(0,1);
  //Escribimos el mensaje
  char EstadoMSG[12] = "Estado: ";
  EstadoMSG[8] = (estado + 48);
  lcd2.print(EstadoMSG);

  // Ubicamos el cursor en la primera posición(columna:0) de la segunda línea(fila:1)
  lcd.setCursor(0, 1);
   // Escribimos el número de segundos trascurridos
  lcd.print(millis()/1000);
  lcd.print(" Segundos");
  //Serial.println("Envio de cartel!");


 

  

  //Delay
  delay(500);

}

void receiveEvent(int bytes){

    //Si esta disponible es el pin de salida
    if(Wire.available()){
       //Leemos el pin que recibimos
       pinOut = Wire.read();
       Serial.print("LED ");
       Serial.println(pinOut);
    }
    //Si sigue disponible es el estado
    if(Wire.available()){
       estado = Wire.read();
       Serial.print("Estado ");
       Serial.println(estado);
    }

    //Encendemos el pin correspondiente
    digitalWrite(pinOut,estado);  
}
