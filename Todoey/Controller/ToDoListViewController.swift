//
//  ViewController.swift
//  Todoey
//
//  Created by 許馨予 on 2019/4/17.
//  Copyright © 2019 Lois Hsu. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    //MARK: - Properties
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    
    
    
    //MARK: -Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)

        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
            itemArray = items
        }
    }
    
    //MARK: -Hnalder
    
    //TODO: TableView Datasource Module

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
         cell.textLabel?.text = item.title
        
        //Ternary Operator
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
//       if item.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
        
        return cell
    }

    
    
    //TODO: TableView Delegate Module
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//          itemArray[indexPath.row].done = false
//        }
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //TODO: Add Item Buttom
    @IBAction func addButtomPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user click the Add Item button on our UIAlet
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

