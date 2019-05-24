//
//  Registro.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

class Registro: UIViewController {
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var numEmpleado: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var tfDate: UITextField!
    
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
                break
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
        let valido = validateData()
        
        if valido{
            
            createData()
            
            dismiss(animated: true, completion: nil)
        }else{
            showAlert(titulo: "Ups", mensaje: "Datos Incompletos")

        }
    }
    
    func createData(){
        // 1.- Refer to persistenContainer from appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // 2.- Create the context from persistentContainer
        let manageContext =  appDelegate.persistentContainer.viewContext
        // 3.- Create an entity with User
        let userEntity = NSEntityDescription.entity(forEntityName: "Empleado", in: manageContext)!
        
        //4.- Create new record with Empleado entity
        
        let emp = NSManagedObject(entity: userEntity, insertInto: manageContext)
        emp.setValue(nombre.text!, forKey: "nombre")
        emp.setValue(pass.text!, forKey: "pass")
        emp.setValue(email.text!, forKey: "email")
        emp.setValue(tfDate.text!, forKey: "fechaNac")
        emp.setValue(numEmpleado.text!, forKey: "numEmpleado")
        emp.setValue(tel.text!, forKey: "tel")
        emp.setValue(confirmPass.text!, forKey: "passConfirm")
        
        //5.- Save context
        do{
            try manageContext.save()
            print("saved correctly")
        }catch{
            print("Error: \(error)")
        }
        
    }
    
}
