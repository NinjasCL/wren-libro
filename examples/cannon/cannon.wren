/**
Juego que simula el disparo de un cañón hacia un objetivo.
El jugador debe ingresar el ángulo para cada tiro del cañón.
Código levemente basado en la obra "Cómo construir juegos de aventura"
de Manuel Afonseca. ISBN 84-7688-019-7
- Author: Camilo Castro <camilo@ninjas.cl>
- Version: 1.0.0
*/

import "random" for Random
import "io" for Stdin

var random = Random.new()

// Un número aleatorio entre 10K y 50K
var alcance = 0

var objetivos = 3
var oportunidades = 5

// Ángulos deben estar en grados
// mínimo 0.5, máximo 89.5
var anguloElevacion = 0.5
var anguloMinimo = 0.5
var anguloMaximo = 89.5

// Sentinela para saber si el objetivo fue destruido
var destruido = false

// Para saber cuantos tiros fueron
// necesarios para destruir al objetivo
var tiros = 0

// Distancia mínima requerida para considerar
// al objetivo como destruido
// Si el proyectil llega a los 100 metros del objetivo
// se considera destruido
// (en metros).
var distanciaMinima = 100

// Distancia alcanzada por el tiro (en metros)
var distanciaAlcanzada = 0

// Distancia final
// distanciaAlcanzada - distanciaObjetivo
var distanciaFinal = 0

// Distancia al azar del objetivo
// Debe ser igual o menor al alcance del cañón
// entre 100 hasta el alcance del cañón.
var distanciaObjetivo = 0

var jugar = true
while (jugar) {

  System.print("Quedan %(objetivos) objetivos")

  // Valores iniciales por cada objetivo
  oportunidades = 5
  destruido = false
  anguloElevacion = 0
  distanciaFinal = 0
  tiros = 1
  alcance = random.int(10000, 50001)
  distanciaObjetivo = random.int(distanciaMinima, alcance + 1)

  System.print("El cañón puede disparar hasta %(alcance) metros")
  System.print("El objetivo está a %(distanciaObjetivo) metros")
  System.print("La fórmula de la distancia es: alcance * sin(2 * ángulo * π / 180)")

  while (oportunidades > 0) {

    while (anguloElevacion < anguloMinimo || anguloElevacion > anguloMaximo) {
      System.print()
      System.print("Ingrese el ángulo para disparar")
      anguloElevacion = Num.fromString(Stdin.readLine())

      if (!anguloElevacion) {
        System.print("Debe ingresar un ángulo.")
        anguloElevacion = 0
      } else if (anguloElevacion > anguloMaximo) {
        System.print("El ángulo debe ser menor a %(anguloMaximo)")
      } else if (anguloElevacion < anguloMinimo) {
        System.print("El ángulo debe ser mayor a %(anguloMinimo)")
      }
    }

    // Calculamos la distancia que el tiro llega con el ángulo ingresado.
    // La fórmula matemática (ángulo * π / 180) convierte los grados del ángulo de
    // elevación a radianes.
    // Luego se obtiene el seno del doble de su valor sin(2 * radianes)
    // y se multiplica por el alcance alcance * sin(2 * radianes).
    // Finalmente se eliminan los decimales redondeando el resultado.
    // redondear(alcance * sin(2 * radianes)).
    // Ver: https://es.khanacademy.org/science/physics/two-dimensional-motion/two-dimensional-projectile-mot/v/projectile-at-an-angle

    distanciaAlcanzada = (alcance * (anguloElevacion * ( 2 * Num.pi / 180)).sin).round
    distanciaFinal = (distanciaAlcanzada - distanciaObjetivo).abs
    System.print("Distancia Alcanzada: %(distanciaAlcanzada.abs) Distancia Objetivo: %(distanciaObjetivo) Diferencia: %(distanciaFinal)")

    destruido = (distanciaMinima >= distanciaFinal)

    if (destruido) {
      objetivos = objetivos - 1
      jugar = (objetivos > 0)
      System.print()
      System.print("!!BooOOOM!!")
      System.print("¡Felicidades!, haz destruido al objetivo en %(tiros) intentos.")
      System.print()
      break
    }

    // Aumentamos el contador de tiros
    tiros = tiros + 1

    // Y reiniciamos el angulo de elevación
    // para volver a solicitarlo
    anguloElevacion = 0
    oportunidades = oportunidades - 1
    System.print()

    if (distanciaAlcanzada > distanciaObjetivo) {
      System.print("El tiro se pasó en %(distanciaFinal) metros.")
    } else {
      System.print("El tiro quedó corto por %(distanciaFinal) metros.")
    }
    
    jugar = (oportunidades > 0)
    if (jugar) {
      System.print("¡Prueba otra vez!, quedan %(oportunidades) tiros")
    } else {
      System.print("Juego terminado. ¡Haz perdido todas tus balas!")
    }
  }
}
