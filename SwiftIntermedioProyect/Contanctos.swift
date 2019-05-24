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
    var lblTelefono: String?
    var expanded: Bool
    
    init(Nombre: String, FechaNac: String, Corre: String, Direccion: String, Telefono: String) {
        self.lblNombre = Nombre
        self.lblFechaNac = FechaNac
        self.lblCorre = Corre
        self.lblDireccion = Direccion
        self.lblTelefono = Telefono
        self.expanded = false
    }
    
}

class Contanctos: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFechaNac: UILabel!
    @IBOutlet weak var lblCorreo: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var btnEditar: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func set(content: expandedCell){
        self.lblNombre.text = content.lblNombre
        self.lblFechaNac.text = content.lblFechaNac
        self.lblCorreo.text = content.lblCorre
        self.lblDireccion.text = content.lblDireccion
        self.lblTelefono.text = content.lblTelefono
    }
    

}
