//
//  Contanctos.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/21/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


class expandedCell{
    var lblNombre: String?
    var lblFechaNac: String?
    var lblCorre: String?
    var lblDireccion: String?
    var lblEmpresa: String?
    var lblArea: String?
    var lblNumero: String?
    var lblAntiguedad:String?
    var lblFecha: String?
    var lblEdad: String?
    var lblCargo: String?
    var lblProductos:String?
    var expanded: Bool
    
    init(Nombre: String, FechaNac: String, Corre: String, Direccion: String, Empresa: String, Area: String, Numero: String, Antiguedad:String, Fecha: String, Edad: String, Cargo: String, Productos:String) {
        self.lblNombre = Nombre
        self.lblFechaNac = FechaNac
        self.lblCorre = Corre
        self.lblDireccion = Direccion
        self.lblEmpresa = Empresa
        self.lblArea = Area
        self.lblNumero = Numero
        self.lblAntiguedad = Antiguedad
        self.lblFecha = Fecha
        self.lblEdad = Edad
        self.lblCargo = Cargo
        self.lblProductos = Productos
        self.expanded = false
    }
    
}


class Contanctos: UITableViewCell {
    
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFechaNac: UILabel!
    @IBOutlet weak var lblCorre: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!

    @IBOutlet weak var lblEmpresa: UILabel!
    
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblNumero: UILabel!
    @IBOutlet weak var lblAntiguedad: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblCargo: UILabel!
    @IBOutlet weak var lblProductos: UILabel!
    
    @IBOutlet weak var btnShare: UIButton!
    
    var expanded: Bool = false
    var isShareAvailable: Bool = false

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(content: expandedCell){
        
        var bithdayDate: Date = convertDate(timeString: content.lblFechaNac)
        var inpayroll: Date = convertDate(timeString: content.lblFecha)
        
        
        self.lblNombre.text = content.lblNombre
        self.lblFechaNac.text = content.expanded ? formatDate(date: bithdayDate) : ""
        self.lblCorre.text = content.expanded ? content.lblCorre : ""
        self.lblDireccion.text = content.expanded ? content.lblDireccion  : ""
        self.lblEmpresa.text = content.expanded ? content.lblEmpresa : ""
        self.lblArea.text = content.expanded ? content.lblArea : ""
        self.lblNumero.text = content.expanded ? "ID: \(content.lblNumero! ?? "0" )" : ""
        self.lblAntiguedad.text = content.expanded ? "\(content.lblAntiguedad!) of seniority" : ""
        self.lblFecha.text = content.expanded ? formatDate(date: inpayroll) : ""
        self.lblEdad.text = content.expanded ? "\(edad(birthday: bithdayDate)) años de edad" : ""
        self.lblCargo.text = content.expanded ? content.lblCargo : ""
        self.lblProductos.text = content.expanded ? content.lblProductos : ""
        self.expanded = false
        isShare(birthday: bithdayDate)
    }

    func convertDate(timeString: String?)-> Date{
        var rdate = Date()
        if let timer =  timeString{
            if let time = Double(timer){
                rdate = Date(timeIntervalSince1970: time)
            }
        }
        return (rdate)
    }
    
    func formatDate(date: Date)-> String{
        let format = DateFormatter()
        format.dateFormat = "dd-MMMM-yyyy"
        return (format.string(from: date))

    }
    
    func edad(birthday: Date) -> String{
        let today = Date()
        
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: today)
        let age = ageComponents.year!

        return ("\(age)")
    }
    
    func isShare(birthday: Date){
        let today = Date()
        let calendar = Calendar.current
        
        let yars = calendar.dateComponents([.year], from: birthday, to: today)
        let yar = yars.year!

        let dateComponents = calendar.dateComponents([Calendar.Component.day], from: birthday, to: today)
        
        let days = (yar * 365) - dateComponents.day!
        print(days)

    }

}
