//
//  Cobranza.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Cobranza: UIViewController {
    
    
    var arrCobranza: [CobranzaEmployee] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initArrC()
    }
    
    func initArrC(){
        
        let ruta1 = Ruta(PersonaAvisitar: "Juan Garcia Perez",
                         Direccion: "Prolongacion Paseo de la Reforma 600, Santa Fe, Zedec Sta Fe, 01219 Ciudad de Mexico, CDMX",
                        Adeudo: "$4,500",
                        Notas: "Casa color amarillo, referencia: tienda de abarrotes")
        let ruta2 = Ruta(PersonaAvisitar: "Calos Lopez Puentes",
                         Direccion: "Nuevo Leon",
                         Adeudo: "$1,530",
                         Notas: "Calle cerrada, Casa con puerton rojo")
        _ = Ruta(PersonaAvisitar: "Cesar Gonzalez Paredes", Direccion: "Napoles", Adeudo: "$10,900", Notas: "Sin Datos")
        
        
        arrCobranza = [CobranzaEmployee(Nombre: "James Arthur Gosling", Rol: "Entrevistador", Ruta: ruta1),
                        CobranzaEmployee(Nombre: "Dennis MacAlistair Ritchie", Rol: "Jefe de cobranza"),
                        CobranzaEmployee(Nombre: "Guido van Rossum", Rol: "Jefe de cobranza"),
                        CobranzaEmployee(Nombre: "Rasmus Lerdorf", Rol: "Entrevistador", Ruta: ruta2)]
    }

    
    @objc func btnRuta(){

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMap"{
            let map =  segue.destination as! Maps
            map.ruta =  (sender as! CobranzaEmployee)
        }
    }
    
}



extension Cobranza: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCobranza.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cobranzaCell", for: indexPath) as! cobranzaCell
        cell.set(context: arrCobranza[indexPath.row])
        if !(cell.btnRuta.isHidden){
            cell.btnRuta.addTarget(self, action: #selector(btnRuta), for: UIControl.Event.touchUpInside)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GoToMap", sender: arrCobranza[indexPath.row])
    }
}
