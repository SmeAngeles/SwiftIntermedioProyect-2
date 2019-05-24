//
//  Empleado.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Empleado: NSObject {

    var nombre: String
    var pass: String
    var email: String
    var fechaNac: String
    var numEmpleado: String
    var tel: String
    var passConfirm: String
    
    init(aNombre: String, aPass: String, aEmail: String,aFechaNac: String, aNumEmpleado:String, aTel:String, aPassConfirm:String){
        self.nombre = aNombre
        self.pass = aPass
        self.email = aEmail
        self.fechaNac = aFechaNac
        self.numEmpleado = aNumEmpleado
        self.tel = aTel
        self.passConfirm = aPassConfirm
    }
}
