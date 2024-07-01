#include <MD_Parola.h>
#include <MD_MAX72xx.h>


#define HARDWARE_TYPE MD_MAX72XX::FC16_HW
#define Numero_Matriz 2
#define CLK_PIN   52
#define DATA_PIN  51
#define CS_PIN    10

MD_Parola P = MD_Parola(HARDWARE_TYPE,  CS_PIN, Numero_Matriz);

struct animaciones
{
  textEffect_t animacion_Entrada;
  textEffect_t animacion_Salida;
  const char * textoSalida;
  int velocidad;
  int pausa;
  textPosition_t justificacion;
};

animaciones  animList[] =
{
  { PA_SCROLL_LEFT, PA_SCROLL_LEFT , "Hola mundo!",  4, 0, PA_LEFT },
  { PA_RANDOM, PA_GROW_DOWN, "Es", 1, 2 , PA_CENTER},
  { PA_SCROLL_LEFT,  PA_SCROLL_LEFT ,"mi primer cartel!!", 5, 0 ,PA_LEFT},
};


int contador = 0;
boolean rebote = true;
int i = 0;  // indice del efecto del texto

void  setup() {
  P.begin();
  Serial1.begin(9600);
  pinMode(2, INPUT);
  
  for (int i=0; i<ARRAY_SIZE(animList); i++)
  {
    animList[i].velocidad *= P.getSpeed(); 
    animList[i].pausa *= 1000;
  }
}


void  loop() {

  if(digitalRead(2) == HIGH && rebote){
     Serial1.println("Deteccion entrada #"+(String)(contador));
     contador++;
     rebote = false;
     
  }

  rebote = true; 
  delay(100);
  

  if (P.displayAnimate())// animaciones retorna verdadero cuando ya termino
  {
    Serial1.println("Efecto #"+(String)(i));
    if (i ==  ARRAY_SIZE(animList)){
      i = 0;  // reinicia el indice
    }

    P.displayText(animList[i].textoSalida,  animList[i].justificacion, animList[i].velocidad,  
                  animList[i].pausa, animList[i].animacion_Entrada,  animList[i].animacion_Salida);
    
    delay(2000);
    //Proxima animacion
    i++;   
  }    
}
