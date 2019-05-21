//
//  Empleados.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Empleados: UIViewController {
    
    var arrEmpleados: [Empleado] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initArr()
    }

    func initArr(){
        let emp1 = Empleado(aNombre: "Julio", aPass: "123", aEmail: "Julio@gmail.com", aFechaNac: "12/07/13", aNumEmpleado: "12", aTel: "55667788", aPassConfirm: "123")
        
        let emp2 = Empleado(aNombre: "Cesar", aPass: "123", aEmail: "Cesar@gmail.com", aFechaNac: "12/10/13", aNumEmpleado: "12", aTel: "55667788", aPassConfirm: "123")
        
        let emp3 = Empleado(aNombre: "Mario", aPass: "123", aEmail: "Mario@gmail.com", aFechaNac: "12/04/13", aNumEmpleado: "12", aTel: "55667788", aPassConfirm: "123")
        
        arrEmpleados.append(emp1)
        arrEmpleados.append(emp2)
        arrEmpleados.append(emp3)
        
    }
    
    @objc func share(){
        
        let image: UIImage = UIImage(named: "share")!
        let text: String = "Feliz Cumpleaños"
        
        let activityController = UIActivityViewController(activityItems:[image,text], applicationActivities: nil)

        present(activityController,animated: true,completion: nil)
    }
        
}

extension Empleados: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmpleados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as! Contanctos
        
        cell.lblNombre.text = arrEmpleados[indexPath.row].nombre
        cell.lblFechaNac.text = arrEmpleados[indexPath.row].fechaNac
        cell.lblUbicacion.text = "CDMX"
        cell.lblParentesco.text = "Amigo"
        cell.btnShare.addTarget(self, action: #selector(share), for: .touchUpInside)
        
        return cell
    }
    
    
}
