#include <Servo.h>
#include <LiquidCrystal.h>
#include <stdio.h>

//Estado del programa
int estado = 0;

//Puertos que utilizaremos para led y botones
const int red = 2;
const int green = 3;
const int yellow = 5;
const int danger = 4;
const int motorDC = 9;
const int motorServo = 10;

//Crear el objeto LiquidCrystal (RS,Enable,D4,D5,D6,D7);
LiquidCrystal lcd(22,23,24,27,29,33);

//Variables del sensor ultrasonico
long duracion; //Tiempo en que la onda viaja al objeto y regresa.
long distancia; // Distancia del objeto
int trig = 12; //Recibe el pulso para comenzar la medidicion
int echo = 11; //Devuelve un pulso continuo, y dura tiempo en que la onda va y regresa.

//Varibles de la pantalla
String mensaje1_fila0 = "     Banda      ";
String mensaje1_fila1 = " en movimiento! ";
String mensaje2_fila0 = "     Banda      ";
String mensaje2_fila1 = "    detenida!   ";
String mensaje3_fila0 = "   Emergencia   ";
String mensaje3_fila1 = "    !!!!!!!!    ";

//Servo motor
Servo servoMotor;
int pos = 0;


void setup() {
  Serial.begin(9600);
  Serial3.begin(9600);

  //Seleccionamos el tipo de pin de salida/entrada
  pinMode(red,OUTPUT);
  pinMode(green,OUTPUT);
  pinMode(yellow,OUTPUT);
  pinMode(motorDC,OUTPUT);
  pinMode(danger,INPUT);

  //Pines del ultrasonico
  pinMode(trig,OUTPUT);
  pinMode(echo,INPUT);

  //Estado inicial de la pantalla
  lcd.begin(16,2); // 16 columnas y 2 filas
  lcd.setCursor(1,0); //1 columna y fila 0
  lcd.print(mensaje2_fila0);
  lcd.setCursor(1,1); //1 columna y fila 1
  lcd.print(mensaje2_fila1);

  //Inicializar servo en que pin
  servoMotor.attach(motorServo);
  
}

void loop() {
  switch(estado){
        case 0: SelectorEstado();
                break;
        case 1: Movimiento();
                break;
        case 2: Detenido();
                break;
        case 3: Emergencias();
                break;              
  }
}

void Emergencias(){
     //Configuracion LEDS
     digitalWrite(red, LOW);
     digitalWrite(green, LOW);
     digitalWrite(yellow, HIGH);

     //configuracion de la pantalla
     lcd.setCursor(1,0); //1 columna y fila 0
     lcd.print(mensaje3_fila0);
     lcd.setCursor(1,1); //1 columna y fila 1
     lcd.print(mensaje3_fila1);

     boton_Emergencia();
     
}

void SelectorEstado(){
     if(Distancia_objeto()){
        //Esta cerca cambiamos de estado
        estado = 1;
     }else{
        //Esta lejos.
        estado = 2;
     }
}

void Detenido(){
     //Configuracion LEDS
     digitalWrite(red, HIGH);
     digitalWrite(green, LOW);
     digitalWrite(yellow, LOW);
     //configuracion de la pantalla
     lcd.setCursor(1,0); //1 columna y fila 0
     lcd.print(mensaje2_fila0);
     lcd.setCursor(1,1); //1 columna y fila 1
     lcd.print(mensaje2_fila1);

     //Verificacion del estado
     SelectorEstado();

     //Boton de emergencia
     boton_Emergencia();
}

void Movimiento(){
     //Configuracion LEDS
     digitalWrite(red, LOW);
     digitalWrite(green, HIGH);
     digitalWrite(yellow, LOW);
     //configuracion de la pantalla
     lcd.setCursor(1,0); //1 columna y fila 0
     lcd.print(mensaje1_fila0);
     lcd.setCursor(1,1); //1 columna y fila 1
     lcd.print(mensaje1_fila1);

     //Movimiento del motor
     Activar_Motor();

     //Verificacion del estado
     SelectorEstado();

     boton_Emergencia();
}

void boton_Emergencia(){
    int boton = digitalRead(danger);
    if(boton == 1){
      //Cambiamo de estado
      estado = 3;
      //Detenemos los motores DC
      digitalWrite(motorDC,LOW);
      //Llamamos a Emergencias
      Emergencias();      
    }
}

void Activar_Motor(){
     // Movemos el servo de 0 a 90
     for(pos = 90;pos >= 0;pos--){
        servoMotor.write(pos);
        //Movimiento motorDC
        digitalWrite(motorDC,HIGH);
        delay(10);
        boton_Emergencia();
     }
     //Movimiento motorDC
     digitalWrite(motorDC,LOW);
}

bool Distancia_objeto(){
     Disparo_Ultrasonico();
     duracion = pulseIn(echo,HIGH); //El tiempo que le toma en ir y venir el sonido.
     //Distancia en centimetros
     distancia = duracion / 58.4;
     
     boton_Emergencia();

     if(distancia <= 300) {
       Serial.println("A menos de 300 cm.");
       return true;
     }else{
       Serial.println("A mas de 300 cm.");
       return false;
     }    
}

void Disparo_Ultrasonico(){
     digitalWrite(trig, LOW);
     delayMicroseconds(4);
     digitalWrite(trig, HIGH);
     delayMicroseconds(10);
     digitalWrite(trig,LOW);
}
