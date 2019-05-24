//
//  Login.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Login: UIViewController {
    
    
    @IBOutlet weak var lblUsuario: UITextField!
    @IBOutlet weak var lblPass: UITextField!
    
    var sujeto1: Empleado?
    
    var arrEmpleados: [Empleado] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSujeto1()
    }
    
    func initSujeto1(){
        
        sujeto1 = Empleado(aNombre: "Julio", aPass: "123", aEmail: "Julio@gmail.com", aFechaNac: "12/07/13", aNumEmpleado: "12", aTel: "55667788", aPassConfirm: "123")
        arrEmpleados.append(sujeto1!)
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
        
        var empData: Empleado?
        
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "registro") as! Registro
        vc.delegateNuevoEmpleado = self
        present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToMenu"{
            
        }
    }
    
}

extension Login: registraNuevoEmpleadoDelegate{
    func obtain(newRegister: Empleado) {
        dismiss(animated: true, completion: nil)
        arrEmpleados.append(newRegister)
        print(arrEmpleados)
    }

}
