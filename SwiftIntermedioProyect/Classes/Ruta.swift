//
//  Ruta.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Ruta: NSObject {

    var personaAvisitar: String
    var direccion: String
    var adeudo: String
    var nota: String
    
    init(PersonaAvisitar:String, Direccion: String, Adeudo:String, Notas: String){
        self.personaAvisitar = PersonaAvisitar
        self.direccion = Direccion
        self.adeudo = Adeudo
        self.nota = Notas
    }
    
}
