import Foundation

class Kahvinkeitin: CustomStringConvertible{
    let vesiSailionKapasiteetti: Int
    let kahviSäiliönKapasiteetti: Int
    var vesiMaara: Int = 0
    var kahviMaara: Int = 0
    var onPaalla = false
    var espressoja: Int{
        min(vesiMaara/30, kahviMaara/16)
    }
    var tavallisia: Int{
        min(vesiMaara/200, kahviMaara/15)
    }
    
    init(_ vesiKapasiteetti: Int = 300, _ kahvinKapasiteetti: Int  = 100){
        self.vesiSailionKapasiteetti = vesiKapasiteetti
        self.kahviSäiliönKapasiteetti = kahvinKapasiteetti
    }
    
    var description: String{
        return "keitin: \(vesiMaara)/ \(vesiSailionKapasiteetti) vettä, \(kahviMaara)/ \(kahviSäiliönKapasiteetti) kahvia, \(onPaalla ? "päällä" : "on kiinni")"
    }
    
    func taytaVesiSailio(){
        vesiMaara = vesiSailionKapasiteetti
    }
    
    func taytaKahviSailio(){
        kahviMaara = kahviSäiliönKapasiteetti
    }
    
    func painaOnOffNappia(){
        onPaalla = !onPaalla
    }
    
    func teeEspresso() -> Bool {
        if onPaalla && espressoja > 0{
            self.vesiMaara -= 30
            self.kahviMaara -= 16
            return true
        } else {
            return false
        }
    }
    
    func teeTavallinenKahvi() -> Bool{
        if onPaalla && tavallisia > 0{
            self.vesiMaara -= 200
            self.kahviMaara -= 15
            return true
        } else{
            return false
        }
    }
}

let k = Kahvinkeitin()
print(k)
k.taytaVesiSailio()
k.taytaKahviSailio()
print(k)
print("espressoja: ", k.espressoja)
print("tavallisia: ", k.tavallisia)
print("tee espresso: ", k.teeEspresso())
print(k)
k.painaOnOffNappia()
print("tee tavallinen kahvi: ", k.teeTavallinenKahvi())
print(k)
for i in 0...4 {
print("tee espresso: ", k.teeEspresso())
print(k)
}
print("espressoja: ", k.espressoja)
print("tavallisia: ", k.tavallisia)
k.taytaVesiSailio()
print(k)
for i in 0...4 {
print("tee espresso: ", k.teeEspresso())
print(k)
}

