//
//  Contanctos.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/21/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Contanctos: UITableViewCell {
    
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFechaNac: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblUbicacion: UILabel!
    @IBOutlet weak var lblParentesco: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
