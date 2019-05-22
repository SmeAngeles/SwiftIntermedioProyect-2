//
//  Employee.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/21/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Employee: Decodable {
    var idEmployee: Int? //Numero de empledo
    var fullName: String? //Nombre completo
    var email: String? // correo
    var photo:String? // fotografia
    var address:String? //Direccion
    var company:String? //Empresa
    var area: String? // area
    var seniority: String? //antiguedad
    var dateInPayroll: String? //fecha de contratación
    var birthday: String? //fecha de nacimiento
    var age: String? // edad
    var maritalStatus: String? //Estado civil
    var role: String? //Cargo
    var productsPurchased: String? //Productos adquiridos con la compañia
}
