//
//  Editar.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/24/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

class Editar: UIViewController {
    
    var empleado: EmpleadoClass?
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfFecha: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfDirec: UITextField!
    @IBOutlet weak var tfTel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitForm()
    }
    
    func InitForm(){
        tfNombre.text = empleado?.nombre
        tfFecha.text = empleado?.fechaNac
        tfCorreo.text = empleado?.email
        tfDirec.text = empleado?.direccion! ?? " "
        tfTel.text = empleado?.tel
    }
    
    @IBAction func actSave(_ sender: Any) {
        updateData()
        //dismiss(animated: true, completion: nil)
        let controller = self.navigationController?.viewControllers[1] 
        self.navigationController?.popToViewController(controller!, animated: true)
    }
    
    func updateData(){
        // 1.- Refer to persistentContainer from appdelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2.- Create the context from persistentContainer
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3.- Prepare the request with predicate for the entity
        let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        fetchRequest.predicate = NSPredicate(format: "nombre == %@", "\(tfNombre.text!)")
        
        // 4.- Fetch record and Set New value with key
        do{
            let record = try manageContext.fetch(fetchRequest)
            let recordToUpdate = record[0] as! NSManagedObject
            recordToUpdate.setValue(tfNombre.text!, forKey: "nombre")
            recordToUpdate.setValue(tfFecha.text!, forKey: "fechaNac")
            recordToUpdate.setValue(tfCorreo.text!, forKey: "email")
            recordToUpdate.setValue(tfDirec.text!, forKey: "dicreccion")
            recordToUpdate.setValue(tfTel.text!, forKey: "tel")
            do{
                // 5.- Save context same as create data
                try manageContext.save()
            }catch{
                print("Error")
            }
        }catch{
            print("Error")

        }
    }
    

}
