#include <LiquidCrystal.h>

//crear un objeto LiquidCrystal (rs,enable,d4,d5,d6,d7)
LiquidCrystal lcd(22, 23, 24, 27, 29, 33);

//Mensaje de bienvenida
String mensaje1_fila0 = " Monitor estado";
String mensaje1_fila1 = "               ";
String mensaje2_fila1 = "Cuarto1 LED:ON ";
String mensaje3_fila1 = "Cuarto1 LED:OFF";
String mensaje4_fila1 = "Cuarto2 LED:ON ";
String mensaje5_fila1 = "Cuarto2 LED:OFF";
String mensaje6_fila1 = "Porton Abriendo";
String mensaje7_fila1 = "Porton Cerrando";


#define Pin12 12
#define Pin13 13
#define Pin2 2

char caracter;
String cadenaRecibida = "";
int estado = -1;

void setup() {
    Serial.begin(9600);
    Serial1.begin(9600);
    pinMode(Pin12, OUTPUT);
    pinMode(Pin13, OUTPUT);
    pinMode(Pin2, OUTPUT);

    //Iniciamos el LCD
    lcd.begin(16, 2); //16 columnas y 2 filas
    lcd.setCursor(1, 0); //1ra columna y fila 0
    lcd.print(mensaje1_fila0);
    lcd.setCursor(1, 1);
    lcd.print(mensaje1_fila1);

}

void loop() {

   //Recibimos la cadena y la guardamos
   if(Serial.available()) {
        caracter = Serial.read();
        cadenaRecibida += caracter;
    }

    //Seleccionamos el estado
    selectorEstado(cadenaRecibida);   

    //Cambiamos de estado segun corresponda
    opcionEstado(estado);
    
}

void selectorEstado(String cadena){
    if(cadenaRecibida == "C1-ON"){ 
        estado = 0;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";
        
        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje2_fila1);
    }
    if(cadenaRecibida == "C1-OFF"){ 
        estado = 1;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";

        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje3_fila1);
    } 
    if(cadenaRecibida == "C2-ON"){ 
        estado = 2;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";

        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje4_fila1);
    }
    if(cadenaRecibida == "C2-OFF"){ 
        estado = 3;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";

        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje5_fila1);
    }
    if(cadenaRecibida == "P1-ON"){ 
        estado = 4;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";

        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje6_fila1);
    }
    if(cadenaRecibida == "P1-OFF"){ 
        estado = 5;
        Serial1.println(cadenaRecibida);
        cadenaRecibida = "";

        //Actualizamos el LCD
        lcd.clear();
        lcd.setCursor(1, 0); //1ra columna y fila 0
        lcd.print(mensaje1_fila0);
        lcd.setCursor(1, 1);
        lcd.print(mensaje7_fila1);
    }
}

void opcionEstado(int estado){
   switch(estado){
        case 0: digitalWrite(Pin12, HIGH); break;
        case 1: digitalWrite(Pin12, LOW); break;
        case 2: digitalWrite(Pin13, HIGH); break;
        case 3: digitalWrite(Pin13, LOW); break;
        case 4: digitalWrite(Pin2, HIGH); break;
        case 5: digitalWrite(Pin2, LOW); break;
   }  
}
