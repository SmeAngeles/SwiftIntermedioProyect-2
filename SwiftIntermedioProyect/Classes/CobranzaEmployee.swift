//
//  CobranzaEmployee.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CobranzaEmployee: NSObject {
        
        var nombre: String
        var rol: String
        var btn: Bool
        var ruta: Ruta?
        
    init(Nombre: String, Rol:String, Ruta: Ruta){
            self.nombre = Nombre
            self.rol =  Rol
            self.btn = false
            self.ruta = Ruta
        }
    
    init(Nombre: String, Rol:String){
        self.nombre = Nombre
        self.rol =  Rol
        self.btn = false
    }
    
}
