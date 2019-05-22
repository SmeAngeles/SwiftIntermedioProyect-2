//
//  Empleados.swift
//  SwiftIntermedioProyect
//
//  Created by Mac on 20/05/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Empleados: UIViewController {
    
    @IBOutlet weak var employeeTable: UITableView!
    
    var arrEmpleados: [expandedCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       callService()
        employeeTable.delegate = self
        employeeTable.dataSource = self
    }
    
    func callService(){
        
        let urlLine = URL(string: "http://www.develogeeks.com/netec/capitulo4/consumoApi/Empleados/getList.php")
        guard let downloadURL = urlLine else { return }
        
        var request = URLRequest(url: downloadURL)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else { return }
            do{
                let decoder = JSONDecoder()
                let downloadEmployee = try decoder.decode(WSStruct.self, from: data)
                for element in downloadEmployee.data{
                    let newEmp =  expandedCell(Nombre: element.fullName!, FechaNac: element.birthday!, Corre: element.email!, Direccion: element.address!, Empresa: element.company!, Area: element.area!, Numero: "\(element.idEmployee!)", Antiguedad: element.seniority!, Fecha: element.dateInPayroll!, Edad: element.age!, Cargo:" ", Productos: " ")
                    self.arrEmpleados.append(newEmp)
                }
                DispatchQueue.main.async{
                    self.employeeTable.reloadData()
                }
            } catch {
                print("Erroorrrrr")
            }
            }.resume()
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
        cell.set(content: arrEmpleados[indexPath.row])
        cell.btnShare.addTarget(self, action: #selector(share), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = arrEmpleados[indexPath.row]
        content.expanded = !content.expanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
