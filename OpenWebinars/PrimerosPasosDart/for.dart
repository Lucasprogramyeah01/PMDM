import 'dart:io';
void main(){

 /*
    Dato de entrada: La base de la tabla de multiplicar
    (este dato debe de ser capturado por el usuario)
    ej: 7      7, 14, 21, 28, 35
    La salida esperada sería
    7 * 1 = 7
    7 * 2 = 14
    7 * 3 = 21
    ..
    7 * 10 = 70
  */

  stdout.writeln("¡BIENVENIDO AL PROGRAMA CALCULADOR DE TABLAS DE MULTIPLICAR!");

  stdout.writeln("\nIngrese el número del que desea saber su tabla:");

  int numero = int.parse(stdin.readLineSync() ?? '¡Introduzca un número!');

  for (var i = 0; i <= 10; i++) {
    int producto = numero * i;

    print("${numero} x ${i} = ${producto}");
  }

}