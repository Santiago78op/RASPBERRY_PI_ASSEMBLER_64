#include <EEPROM.h>

// Dirección en la EEPROM
int direccion = 0;
int direccionMedianas = 0;

// Valor a escribir en la dirección de la EEPROM
byte valor = 42;

void setup() {
  // Inicialización del puerto serial
  Serial.begin(9600);

  // Lectura del valor almacenado en la dirección de la EEPROM
  byte valorLeido = EEPROM.read(direccion);

  // Si el valor leído es diferente del valor que queremos escribir, lo escribimos
  if (valorLeido != valor) {
    Serial.println("Escribiendo en la EEPROM...");
    //EEPROM.write(direccion, valor);
  } else {
    Serial.println("El valor ya está escrito en la EEPROM.");
  }
}

void loop() {
  // Lectura del valor almacenado en la dirección de la EEPROM
  byte valorLeido = EEPROM.read(direccion);

  // Impresión del valor leído
  Serial.print("Valor en la direccion ");
  Serial.print(direccion);
  Serial.print(": ");
  Serial.println(valorLeido);

  // Espera 1 segundo antes de la próxima lectura
  delay(1000);
}
