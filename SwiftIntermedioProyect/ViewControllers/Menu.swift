//
//  Menu.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func acMostrarContactos(_ sender: Any) {
        performSegue(withIdentifier: "MenuToContactos", sender: nil)
    }
    
    
    @IBAction func acMostrarCobranza(_ sender: Any) {
        performSegue(withIdentifier: "MenuToCobranza", sender: nil)
    }
}
