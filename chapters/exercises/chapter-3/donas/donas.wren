
var donas = Fn.new {|cantidad|
  // Tu código aquí
}


// Pruebas para evaluar que el ejercicio
// se ha completado exitosamente.
// no modificar.

var probar = Fn.new {|tengo, quiero|
  var prefijo = " X "
  if (tengo == quiero) {
    prefijo = " OK "
  }
  System.print("%(prefijo) tengo: %(tengo) quiero: %(quiero)")
}

System.print("Probando donas")
probar.call(donas.call(4), "Número de donas: 4")
probar.call(donas.call(9), "Número de donas: 9")
probar.call(donas.call(10), "Número de donas: muchas")
probar.call(donas.call(99), "Número de donas: muchas")
System.print()
