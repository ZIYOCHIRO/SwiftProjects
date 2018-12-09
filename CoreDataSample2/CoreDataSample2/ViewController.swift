//
//  ViewController.swift
//  CoreDataSample2
//
//  Created by 10.12 on 2018/12/9.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results: NSArray = []

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTable()
    }

    @IBAction func Save(_ sender: Any) {
        
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        // create cell
        let cell = NSEntityDescription.insertNewObject(forEntityName: "Form", into: context)
        cell.setValue(nameField.text, forKey: "name")
        cell.setValue(surnameField.text, forKey: "surname")
        
        // Save the context
        do {
            try context.save()
        } catch {
            // this block is used to handle the error appropriately
            print("error")
        }
        
        self.loadTable()
        self.tableView.reloadData()
        
        // make sure the textfields are empty after we click the save buttonS
        nameField.text = ""
        surnameField.text = ""
        
        
    }
    
    func loadTable() {
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Form")
        request.returnsObjectsAsFaults = false
        
        // do catch error
        do {
            results = try context.fetch(request) as NSArray
        } catch {
            // deal with error here
        }
    }
    
    // Tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        let aux = results[indexPath.row] as! NSManagedObject
        cell.textLabel!.text = aux.value(forKey: "name") as? String
        cell.detailTextLabel!.text = aux.value(forKey: "surname") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Name contacts"
    }
    
    
}

