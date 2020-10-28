// nombre: dragon.wren
// autor: Camilo Castro <camilo@ninjas.cl>
// original: https://github.com/asweigart/inventwithpython3rded/blob/master/translations/es/src/drag%C3%B3n.py
// ejecutar: wren dragon/dragon.wren

import "random" for Random
import "timer" for Timer
import "io" for Stdin

var random = Random.new()

var mostrarIntroduccion = Fn.new {
  System.print("Estás en una tierra llena de dragones. Frente a tí")
  System.print("hay dos cuevas. En una de ellas, el dragón es generoso y")
  System.print("amigable y compartirá su tesoro contigo. El otro dragón")
  System.print("es codicioso y está hambriento, y te devorará inmediatamente.")
  System.print()
  }

  var elegirCueva = Fn.new {
  var cueva = null
  var primerDragon = "1"
  var segundoDragon = "2"

  while (cueva != primerDragon && cueva != segundoDragon) {
    System.print("¿A qué cueva quieres entrar? (1 ó 2)")
    cueva = Stdin.readLine()
  }
  return cueva
}

var explorarCueva = Fn.new { |cueva|
    // existen 1000 millisegundos en un segundo
    // por lo que para obtener 2 segundos
    // debemos multiplicar 2 * 1000
    var dosSegundos = 2 * 1000

    System.print("Te aproximas a la cueva...")
    Timer.sleep(dosSegundos)
    
    System.print("Es oscura y espeluznante...")
    Timer.sleep(dosSegundos)
    
    System.print("¡Un gran dragon aparece súbitamente frente a tí! Abre sus fauces y...")
    System.print()
    Timer.sleep(dosSegundos)

    // Un número aleatorio entre 1 y 2.
    // se necesita usar 3 debido a que el generador
    // no incluye el último número
    var cuevaAmigable = random.int(1, 3).toString

    if (cueva == cuevaAmigable) {
      System.print("¡Te regala su tesoro!")
    } else {
      System.print("¡Te engulle de un bocado!")
    }

    System.print()
}

var jugarDeNuevo = "sí"
while (jugarDeNuevo == "sí" || jugarDeNuevo == "si" || jugarDeNuevo == "s") {
  mostrarIntroduccion.call()
  var cueva = elegirCueva.call()
  explorarCueva.call(cueva)

  System.print("¿Quieres jugar de nuevo? (sí o no)")
  jugarDeNuevo = Stdin.readLine()
}

System.print("¡Eso fue divertido, nos vemos luego!")
