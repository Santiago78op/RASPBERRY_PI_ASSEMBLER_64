//
#define pullDown1 2
#define led 3

bool mensaje = true;
char cadena[2] = {'1','2'}; 
bool estadoLED = true;

void setup() {
  Serial.begin(9600);
  pinMode(pullDown1,INPUT);
  pinMode(led, OUTPUT);

  digitalWrite(led,LOW);
  
}

void loop() {
    inicio();
    prenderLED();
    

}

void inicio(){
   if(mensaje){
     Serial.println("Hola Mundo! "+(String)cadena[0]);
     mensaje = false;
   }
}

void prenderLED(){
  if((digitalRead(pullDown1) == HIGH) && estadoLED){
     digitalWrite(led, HIGH);
     estadoLED = false;  
     Serial.println("Encendido"); 
     delay(500);  //500 ms
  }else if((digitalRead(pullDown1) == HIGH && !estadoLED)){
     digitalWrite(led, LOW);
     estadoLED = true;
     Serial.println("Apagado");
     delay(500);
  }
  
}
