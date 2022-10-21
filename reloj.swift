class Reloj {

    var horas: Int = 0
    var minutos: Int = 0
    var segundos: Int = 0

    func setReloj (tiempoEnSegundos: Int) { // divide los segundos en horas, minutos y segundos
        if tiempoEnSegundos >= 3600 {
            horas = tiempoEnSegundos / 3600
        }
        if tiempoEnSegundos >= 60 {
            minutos = (tiempoEnSegundos % 3600) / 60
        }
            segundos = tiempoEnSegundos - (horas * 3600 + minutos * 60)
    }
    func increaseTick () { // Aumenta +1 segundo
        if segundos + 1  < 60 {
            segundos += 1
        } else if minutos + 1 < 60 {
            segundos = 0
            minutos += 1
        } else {
            segundos = 0
            minutos = 0
            horas += 1
        }
    }
    func addReloj (reloj: Reloj) { // suma de relojs

        let segundos1 =  horas * 3600 + minutos * 60 + segundos
        let segundos2 = reloj.horas*3600 + reloj.minutos*60 + reloj.segundos 
        self.setReloj(tiempoEnSegundos: segundos1 + segundos2)
    }
    func ToString () -> String {
        return ("[\(horas):\(minutos):\(segundos)]")
    }
    func tickDecrement () { // decrementa en -1 segundo
        if segundos - 1  >= 0 {
            segundos -= 1
        } else if minutos - 1 >= 0 {
            minutos -= 1
            segundos = 59
        } else {
            segundos = 59
            minutos = 59
            horas -= 1
        }
    }
}
    let reloj1 = Reloj()
    let reloj2 = Reloj()

    reloj1.setReloj(tiempoEnSegundos: 3599)
    print("reloj 1", reloj1.ToString())
    reloj2.setReloj(tiempoEnSegundos: 3000)
    print("reloj 2", reloj2.ToString())

    reloj1.increaseTick()
    print("reloj1 incrementa +1",reloj1.ToString())
    reloj1.tickDecrement()
    print("reloj1 decrementa -1",reloj1.ToString())

    reloj2.addReloj(reloj: reloj1)
    print("add reloj2 + reloj1",reloj2.ToString())
    