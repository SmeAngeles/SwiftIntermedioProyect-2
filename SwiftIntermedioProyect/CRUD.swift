//
//  CRUD.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData

class CRUD: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
    }
    
    func createData(){
        // 1.- Refer to persistentCOntainer form appdelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2. Create the contexxt from prsistentCOntainer
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3. Prepare the request with predicate for the entity
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        //4. Fethc the result from context
        do{
             //let result try manageCOntext.fetch(fetchRequest)
             //5. interate throuch an array to get value for the specific key
            
//            for data in result as! [NSManagedObject]{
//            }
        }catch{
            print("Error")
        }
        
        
    }


}
