//
//  Empleados.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

class Empleados: UIViewController {
    
    var arrEmpleados: [EmpleadoClass] = []
    
    var arrEmpleadosCell: [expandedCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        upDateEmpleados()
    }

    func upDateEmpleados(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        do{
            let result = try manageContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                
                let cellarr: expandedCell?
                
                if data.value(forKey: "dicreccion") != nil{
                    cellarr = expandedCell(Nombre: data.value(forKey: "nombre") as! String,
                                               FechaNac: data.value(forKey: "fechaNac") as! String,
                                               Corre: data.value(forKey: "email") as! String,
                                               Direccion: data.value(forKey: "dicreccion") as! String,
                                               Telefono: data.value(forKey: "tel") as! String)
                    let emp = EmpleadoClass(aNombre: data.value(forKey: "nombre") as! String,
                                            aPass: data.value(forKey: "pass") as! String,
                                            aEmail: data.value(forKey: "email") as! String,
                                            aFechaNac: data.value(forKey: "fechaNac") as! String,
                                            aNumEmpleado: data.value(forKey: "numEmpleado") as! String,
                                            aTel: data.value(forKey: "tel") as! String,
                                            aPassConfirm: data.value(forKey: "passConfirm") as! String)
                    emp.direccion = (data.value(forKey: "dicreccion") as! String)
                    arrEmpleados.append(emp)
                }else{
                    cellarr = expandedCell(Nombre: data.value(forKey: "nombre") as! String,
                                               FechaNac: data.value(forKey: "fechaNac") as! String,
                                               Corre: data.value(forKey: "email") as! String,
                                               Direccion: " ",
                                               Telefono: data.value(forKey: "tel") as! String)
                    let emp = EmpleadoClass(aNombre: data.value(forKey: "nombre") as! String,
                                            aPass: data.value(forKey: "pass") as! String,
                                            aEmail: data.value(forKey: "email") as! String,
                                            aFechaNac: data.value(forKey: "fechaNac") as! String,
                                            aNumEmpleado: data.value(forKey: "numEmpleado") as! String,
                                            aTel: data.value(forKey: "tel") as! String,
                                            aPassConfirm: data.value(forKey: "passConfirm") as! String)
                    arrEmpleados.append(emp)
                }
                
                arrEmpleadosCell.append(cellarr!)
            }
            
        }catch{
            print("Error")
        }
        
    }
    
    @objc func edit(_ sender: UIButton){
        performSegue(withIdentifier: "toEdit", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEdit"{
            let editVC = segue.destination as! Editar
            editVC.empleado = arrEmpleados[sender as! Int]
        }
    }
        
}

extension Empleados: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmpleadosCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as! Contanctos
        cell.set(content: arrEmpleadosCell[indexPath.row])
        cell.btnEditar.tag = indexPath.row
        cell.btnEditar.addTarget(self, action: #selector(edit(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = arrEmpleadosCell[indexPath.row]
        content.expanded = !content.expanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
