//
//  Registro.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Registro: UIViewController {
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var numEmpleado: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var tfDate: UITextField!
    
    var delegateNuevoEmpleado: registraNuevoEmpleadoDelegate?
    var arrTf: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardDismissRecognizer()
        arrTf.append(nombre)
        arrTf.append(pass)
        arrTf.append(confirmPass)
        arrTf.append(email)
        arrTf.append(numEmpleado)
        arrTf.append(tel)
        arrTf.append(tfDate)
    }
    
    func setupKeyboardDismissRecognizer(){
        let tapRec: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard))
        self.view.addGestureRecognizer(tapRec)
    }
    
    func validateData() -> Bool {
        var valido = false
        for tf in arrTf{
            if (tf.text?.isEmpty)!{
                valido = false
            }else{
                valido = true
            }
        }
        return valido
    }
    
    
    func showAlert(titulo:String ,mensaje: String ){
        let alert =  UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        let ok =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    @objc func dismisKeyboard(){
        view.endEditing(true)
    }
    
    @objc func datePickerChaged(sender: UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "dd-MMMM-yyyy"
        tfDate.text  = format.string(from: sender.date)
    }
    
    @IBAction func acFecha(_ sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode =  UIDatePicker.Mode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerChaged), for: .valueChanged)
    }
    
    @IBAction func actGuardar(_ sender: Any) {
        var valido = true
        
        if valido{
            var newEmpleado = Empleado(aNombre: nombre.text!, aPass: pass.text!, aEmail: email.text!, aFechaNac: tfDate.text!, aNumEmpleado: numEmpleado.text!, aTel: tel.text!, aPassConfirm: confirmPass.text!)
            
            delegateNuevoEmpleado?.obtain(newRegister: newEmpleado)
        }else{
            showAlert(titulo: "Ups", mensaje: "Datos Incompletos")

        }
    }
}

protocol registraNuevoEmpleadoDelegate {
    func obtain(newRegister: Empleado)
}
