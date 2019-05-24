//
//  cobranzaCell.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class cobranzaCell: UITableViewCell {
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblRol: UILabel!
    @IBOutlet weak var btnRuta: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(context: CobranzaEmployee){
        
        lblNombre.text =  context.nombre
        lblRol.text =  context.rol
        
        let showBtn = verBoton(rol: context.rol)
        
        showBtn ? (btnRuta.isHidden = false) : (btnRuta.isHidden = true)
        showBtn ? (self.backgroundColor = UIColor.white) : (self.backgroundColor = UIColor.blue)
        
    }
    
    func verBoton(rol: String)-> Bool{
        var isShow = false
        switch rol {
        case "Jefe de cobranza":
            isShow = false
        default:
            isShow = true
        }
        return isShow
    }

}
