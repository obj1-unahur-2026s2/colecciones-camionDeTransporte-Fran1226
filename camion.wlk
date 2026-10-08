import cosas.*
object camion {
    const cosasCargadas = []

    method cargar(algo) {cosasCargadas.add(algo)}
    method descargarDeCarga(algo) {cosasCargadas.remove(algo)}
    method peso() = 1000 + cosasCargadas.sum({c => c.peso()})
    method cosasCargadas() = cosasCargadas
    method elPesoDeTodasLasCosasCargadasSonPares() {cosasCargadas.all({c => c.peso().even()})}
    method hayCosaQuePesa(unNumero) {cosasCargadas.any({c => c.peso() == unNumero})}
    method hayCosaQueTienePeligrosidad(unNumero) {cosasCargadas.find({c => c.nivelPeligrosidad() == unNumero})}
    method cosasQueSuperanPeligrosidad(unNumero) {cosasCargadas.filter({c => c.nivelPeligrosidad() > unNumero})}
    method estaExcedidoDePeso() {return self.peso() > 2500}
    method puedeCircularEnRuta(unNumero) {return !self.estaExcedidoDePeso() and self.hayAlgunaCosaQueTienePeligrosidad(unNumero)}
    method hayAlgunaCosaQueTienePeligrosidad(unNumero) {return cosasCargadas.any({c => c.nivelPeligrosidad() == unNumero})}

    method hayCosaQuePesaEntreY(unNumero, otroNumero) {return cosasCargadas.any({c => c.peso().between(unNumero, otroNumero)})}
    method cosaMasPesadaCargada() {cosasCargadas.max({c => c.peso()})}
}