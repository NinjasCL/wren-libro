// Basado en https://github.com/asweigart/inventwithpython3rded/blob/master/translations/es/src/adivinaElN%C3%BAmero.py

import "random" for Random
import "io" for Stdin

var random = Random.new()

var intentos = 0
var maxIntentos = 6

System.print("¡Hola!, ¿Cómo te llamas?")

var nombre = Stdin.readLine()
System.print("Bueno, %(nombre), estoy pensando en un número entre 1 y 20.")

var numero = random.int(1, 20)
var estimacion = -1

while (intentos < maxIntentos) {
    intentos = intentos + 1
    System.print("Intenta adivinar %(intentos)/%(maxIntentos)")
    
    estimacion = Num.fromString(Stdin.readLine())

    if (estimacion is Null) {
        System.print("Solo admito números")
    } else if (estimacion < numero) {
        System.print("Tu estimación es muy baja")
    } else if (estimacion > numero) {
        System.print("Tu estimación es muy alta")
    } else {
        break
    }
}

if (estimacion == numero) {
    System.print("¡Buen trabajo, %(nombre)! ¡Haz adivinado mi número en %(intentos) intentos!.")
}

if (estimacion != numero) {
    System.print("Pues no. El número que estaba pensando era %(numero)")
}
