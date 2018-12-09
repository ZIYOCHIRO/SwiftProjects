//
//  ViewController.swift
//  CoreDataSample1
//
//  Created by 10.12 on 2018/12/9.
//  Copyright © 2018 Rui. All rights reserved.
//


import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @objc var results : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        
        // INSERT
        let celda = NSEntityDescription.insertNewObject(forEntityName: "Cell", into:  context)
        celda.setValue("Yoda Tux", forKey: "title")
        celda.setValue("Science Fiction", forKey: "subtitle")
        celda.setValue("yodaTux.png", forKey: "image")
        
        celda.setValue("Yoda Tux 2", forKey: "title")
        celda.setValue("Science Fiction", forKey: "subtitle")
        celda.setValue("yodaTux.png", forKey: "image")
        
        do {
            try context.save()
        }
        catch {
            print("Error!")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult> (entityName: "Cell")
        request.returnsObjectsAsFaults = false
        results = try? context.fetch(request) as NSArray
        
        if (results!.count>0){
            for res in results! {
                print(res)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        let aux = results![(indexPath as NSIndexPath).row] as! NSManagedObject
        
        cell.textLabel!.text = aux.value(forKey: "title") as? String
        cell.detailTextLabel?.text = aux.value(forKey: "subtitle") as? String
        cell.imageView!.image = UIImage(named: aux.value(forKey: "image") as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String?  {
        return "TuxMania"
    }
    
}
