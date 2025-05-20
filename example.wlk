class dependencia {
  const flota = []
  var property empleados = 0
  method agregarAFlota(rodado){flota.add(rodado)}

  method quitarDeFlota(rodado){flota.remove(rodado)}

  method pesoTotalFlota(){flota.sum({r=>r.peso()})}

  method estaBienEquipada(){return self.tieneAlMenos3Rodados() && self.todosVanAlMenosA100()}
  method tieneAlMenos3Rodados(){return flota.size() > 3}
  method todosVanAlMenosA100(){return flota.all({r=>r.velocidadMaxima() >= 100})}

  method capacidadTotalEnColor(color){self.filtrarPorColor(color).sum({r=>r.capacidad()})}
  method filtrarPorColor(color){flota.filter({r=>r.color() == color})}

}

class Corsa {
  var property color
  method capacidad(){return 4}
  method velocidadMaxima(){return 150}
  method peso(){return 1300}
}

class Kwid{
  var property tieneTanqueAdicional
  method capacidad(){return if(not tieneTanqueAdicional) 4 else 3}
  method velocidadMaxima(){return if(not tieneTanqueAdicional) 120 else 110}
  method peso(){return 1200 + if(not tieneTanqueAdicional) 0 else 150}
  method color(){return "azul"}
}

object traffic{
  var property interior = comodo
  var property motor = pulenta
  method capacidad(){return interior.capacidad()}
  method velocidadMaxima(){return motor.velocidadMaxima()}
  method peso(){return 4000 + interior.peso() + motor.peso()}
  method color(){return "blanco"}
}

object comodo{
  method capacidad(){return 5}
  method peso(){return 700}
}

object popular{
  method capacidad(){return 12}
  method peso(){return 1000}
}

object pulenta{
  method velocidadMaxima(){return 130}
  method peso(){return 800}
}

object bataton{
  method velocidadMaxima(){return 80}
  method peso(){return 500}
}

class Especial{
  var property color
  var property capacidad
  method velocidadMaxima(){return velocidadMaxima.min(topeVelocidadMaxima.tope())}
  //var property velocidadMaxima
  const property velocidadMaxima // hace que una vez seteado, no se puede cambiar nunca
  var property peso
}

object topeVelocidadMaxima{
  var property tope = 200
}