object knightRider {
    
    method peso() = 500
    method nivelPeligrosidad() = 10
    method bulto() = 1
}

object bumblebee {
    var estaTransformadoEnAuto = true
    
    method peso() = 800
    method nivelPeligrosidad() {if (estaTransformadoEnAuto) {15} else {30}}
    method cambiarEstado() {estaTransformadoEnAuto = !estaTransformadoEnAuto}
    method bulto() = 2
}

object paqueteLadrillos {
    var cantLadrillos = 10

    method peso() = cantLadrillos * 2
    method nivelPeligrosidad() = 2
    method cambiarCantLadrillos(unNumero) {cantLadrillos = unNumero}
    method bulto() {return 
        if (cantLadrillos <= 100) {1} 
        else if (cantLadrillos >= 101 and cantLadrillos <= 300) {2} 
        else {3}
    }
}

object arenaAGranel {
    var peso = 10

    method peso() = peso
    method nivelPeligrosidad() = 1
    method cambiarPeso(unNumero) {peso = unNumero}
    method bulto() = 1

}

object bateriaAntiarea {
    const estaConMisiles = true
    
    method peso() {return if (estaConMisiles) {300} else {200}}
    method nivelPeligrosidad() {if (estaConMisiles) {100} else {0}}
    method bulto() {return if (estaConMisiles) {2} else {1}}
}

object contenedorPortuario {
    const cosasAdentro = []

    method peso() = 100 + self.pesoDeLasCosas()
    method pesoDeLasCosas() = cosasAdentro.sum{c => c.peso()}
    method nivelPeligrosidad() {
        if (!cosasAdentro.isEmpty()) 
            {cosasAdentro.max({c => c.nivelPeligrosidad()})} 
        else 
            {0}
    }
    method agregarCosa(unaCosa) {cosasAdentro.add(unaCosa)}
    method bulto() = 1 + cosasAdentro.sum{c => c.bulto()}
}

object residuosRadioactivos {
    var peso = 30

    method peso() = peso
    method nivelPeligrosidad() = 200
    method cambiarPeso(unNumero) {peso = unNumero}
    method bulto() = 1
}

object embalajeSeguridad {
    var cosaQueEnvuelve = residuosRadioactivos

    method peso() = cosaQueEnvuelve.peso()
    method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() * 0.5
    method cambiarCosa(unaCosa) {cosaQueEnvuelve = unaCosa}
    method bulto() = 2
}