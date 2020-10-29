/*
Snail Race, por Al Sweigart <al@inventwithpython.com>
https://github.com/asweigart/PythonStdioGames/blob/main/src/gamesbyexample/snailrace.py
Una carrera de caracoles, ¡alucinante!.
Adaptado a Wren por Camilo Castro <camilo@ninjas.cl>
https://github.com/NinjasCL/wren-libro/blob/main/juegos/caracoles/caracoles.wren
- Tags: short, beginner, artistic, corto, novato, artistico
- Version: 1.0.0
*/
import "random" for Random
import "timer" for Timer
import "io" for Stdin

var random = Random.new()

class Constantes {
  static minCaracoles { 2 }
  static maxCaracoles { 8 }
  static maxLargoNombre { 20 }
  static meta { 40 }
}


System.print("
La gran carrera de caracoles

    @v <-- caracol

")

var cantidad = null

while (true) {
  System.print("¿Cuántos caracoles correrán? Min:%(Constantes.minCaracoles) Max:%(Constantes.maxCaracoles)")
  cantidad = Num.fromString(Stdin.readLine())
  if (cantidad && cantidad >= Constantes.minCaracoles && cantidad <= Constantes.maxCaracoles) {
    break
  }
  System.print("Ingresar un número entre %(Constantes.minCaracoles) y %(Constantes.maxCaracoles)")
}

var nombres = []

for (i in 1..cantidad) {
  var nombre = ""
  while (true) {
    
    System.print("Ingresa el nombre del caracol #%(i):")
    nombre = Stdin.readLine()

    // Reducimos el nombre a su largo máximo
    nombre = nombre.take(Constantes.maxLargoNombre).join()
    
    if (nombre.count == 0) {
      System.print("Por favor ingresa un nombre.")
    } else if (nombres.contains(nombre)) {
      System.print("Nombre ya existe")
    } else {
      break
    }
  }
  nombres.add(nombre)
}

var cabeceras = Fn.new {
  System.print("\n" * 40)
  System.print("INICIO" + " " * (Constantes.meta - "INICIO".count) + "META")
  System.print("|" + " " * (Constantes.meta - "|".count) + "|")
}

cabeceras.call()

var caracoles = {}

for (nombre in nombres) {
  System.print(nombre)
  System.print("@v")
  caracoles[nombre] = 0
}

// 1.5 segundos
Timer.sleep(15 * 100)

while (true) {

  for (i in 0..(random.int(1, cantidad + 1))) {
    var nombre = random.sample(nombres)
    caracoles[nombre] = caracoles[nombre] + 1

    if (caracoles[nombre] >= Constantes.meta) {
      System.print("¡Ha ganado %(nombre)!")
      // Terminar el proceso del juego
      Fiber.yield()
    }
  }

  // 0.5 segundos
  Timer.sleep(500)

  cabeceras.call()

  for (nombre in nombres) {
    var espacios = caracoles[nombre]
    System.print(" " * espacios + nombre)
    System.print("." * espacios + "@v")
  }
}
