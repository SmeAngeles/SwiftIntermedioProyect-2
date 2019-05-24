//
//  Login.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

class Login: UIViewController {
    
    
    @IBOutlet weak var lblUsuario: UITextField!
    @IBOutlet weak var lblPass: UITextField!
    
    var sujeto1: EmpleadoClass?
    
    var arrEmpleados: [EmpleadoClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDateEmpleados()
    }
    
    func upDateEmpleados(){
        // 1.- Refer to persistentContainer from appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2.- Create the context from persistentContainer
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3.- Prepare the request of type NSFetchRequest for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        
        do{
            // 4.- Fetch the result from context
            let result = try manageContext.fetch(fetchRequest)
            
            // 5.- Interate through an array to get value for the specific key
            for data in result as! [NSManagedObject]{
                let emp = EmpleadoClass(aNombre: data.value(forKey: "nombre") as! String,
                                        aPass: data.value(forKey: "pass") as! String,
                                        aEmail: data.value(forKey: "email") as! String,
                                        aFechaNac: data.value(forKey: "fechaNac") as! String,
                                        aNumEmpleado: data.value(forKey: "numEmpleado") as! String,
                                        aTel: data.value(forKey: "tel") as! String,
                                        aPassConfirm: data.value(forKey: "passConfirm") as! String)
                arrEmpleados.append(emp)
            }
            
        }catch{
            print("Error")
        }
        
    }
    
    func validateIsEmpty()->Bool{
        let isEmpty:Bool
        
        ((lblUsuario.text?.isEmpty)! || (lblPass.text?.isEmpty)!) ? (isEmpty = true) : (isEmpty = false)
        
        return isEmpty
    }
    
    func validateUser()->Bool{
        var isUser = false
        
        for empleado in arrEmpleados{
            if (lblUsuario.text == empleado.email || lblUsuario.text == empleado.nombre) && lblPass.text == empleado.pass{
                isUser = true
            }
            
        }
        return isUser
    }
    
    func showAlert(titulo:String ,mensaje: String ){
        let alert =  UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        let ok =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    func olvidePass(){
        
        var empData: EmpleadoClass?
        
        let olvidePassAlert =  UIAlertController(title: "Recuperar Contraseña", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let show = UIAlertAction(title: "Recuperar", style: UIAlertAction.Style.default,handler: { (action) in
            let tfUser = olvidePassAlert.textFields![0]
            
            for empleado in self.arrEmpleados{
                if (tfUser.text == empleado.email){
                    empData = empleado
                }
            }
            
            if let emp = empData{
                self.showAlert(titulo: "Recuperar Contraseña", mensaje: "Email:\((emp.nombre))  \nPass: \((emp.pass)) ")
            }else{
                self.showAlert(titulo: "Recuperar Contraseña", mensaje: "Usuario no registrado ")
            }
        })
        
        olvidePassAlert.addAction(show)
        
        olvidePassAlert.addTextField { (tf) in
            tf.placeholder = "Email"
        }
        
        present(olvidePassAlert, animated: true, completion: nil)
    }
    
    @IBAction func acLogin(_ sender: UIButton) {
        let isEmpty = validateIsEmpty()
        if !isEmpty{
            let isUser = validateUser()
            if isUser{
                performSegue(withIdentifier: "loginToMenu", sender: nil)
            }else{
                showAlert(titulo: "Ups!", mensaje: "Verifica los datos")
            }
        }else{
            showAlert(titulo: "Ups!", mensaje: "LLena Todos los campos")
        }
        
    }
    
    @IBAction func acOlvidoContraseña(_ sender: Any) {
        olvidePass()
    }
    
    @IBAction func acRegistro(_ sender: Any) {
        performSegue(withIdentifier: "LoginToRegistro", sender: nil)
    }
    
}

public class EmpleadoClass{
    var nombre: String
    var pass: String
    var email: String
    var fechaNac: String
    var numEmpleado: String
    var tel: String
    var passConfirm: String
    var direccion:String?
    
    init(aNombre: String, aPass: String, aEmail: String,aFechaNac: String, aNumEmpleado:String, aTel:String, aPassConfirm:String){
        self.nombre = aNombre
        self.pass = aPass
        self.email = aEmail
        self.fechaNac = aFechaNac
        self.numEmpleado = aNumEmpleado
        self.tel = aTel
        self.direccion = " "
        self.passConfirm = aPassConfirm
    }
}
