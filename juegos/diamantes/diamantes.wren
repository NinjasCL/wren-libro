/*
Diamantes, por Al Sweigart <al@inventwithpython.com>
https://github.com/asweigart/PythonStdioGames/blob/main/src/gamesbyexample/diamonds.py
Dibuja diamantes de varios tamaños.
Adaptado a Wren por Camilo Castro <camilo@ninjas.cl>
                           /\       /\
                          /  \     //\\
            /\     /\    /    \   ///\\\
           /  \   //\\  /      \ ////\\\\
 /\   /\  /    \ ///\\\ \      / \\\\////
/  \ //\\ \    / \\\///  \    /   \\\///
\  / \\//  \  /   \\//    \  /     \\//
 \/   \/    \/     \/      \/       \/
- Tags: tiny, beginner, artistic, pequeño, novato, artistico
- Version: 1.0.0
*/

var mostrarDiamanteLineal = Fn.new { |dimension|
  // Mostrar la parte superior del diamante
  for (i in 0...dimension) {
    // Espacio izquierdo
    System.write(" " * (dimension - i - 1))
    // Parte izquierda del diamante
    System.write("/")
    // Espacio interior del diamante
    System.write(" " * (i * 2))
    // Parte derecha del diamante
    System.print("\\")
  }

  // Mostrar la parte inferior del diamante
  for (i in 0...dimension) {
    // Espacio izquierdo
    System.write(" " * i)
    // Lado izquierdo
    System.write("\\")
    // Espacio interior
    System.write(" " * ((dimension - i - 1) * 2))
    // Lado derecho
    System.print("/")
  }
}

var mostrarDiamanteRelleno = Fn.new { |dimension|
  // Mostrar la cara superior del diamante
  for (i in 0...dimension) {
    // Espaciado izquierdo
    System.write(" " * (dimension - i - 1))
    // Lado izquierdo
    System.write("/" * (i + 1))
    // Lado derecho
    System.print("\\" * (i + 1))
  }

  // Mostrar la cara inferior del diamante
  for (i in 0...dimension) {
    // Espaciado izquierdo
    System.write(" " * i)
    // Lado izquierdo
    System.write("\\" * (dimension - i))
    // Lado derecho
    System.print("/" * (dimension - i))
  }
}


System.print("Diamantes, por Al Sweigart al@inventwithpython.com")

// Muestra 5 diamantes de tamaño 0 al 5:
for(dimension in 0..5) {
  mostrarDiamanteLineal.call(dimension)
  System.print()
  mostrarDiamanteRelleno.call(dimension)
  System.print()
}
