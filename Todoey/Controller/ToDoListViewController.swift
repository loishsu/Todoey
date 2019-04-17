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
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    
    
    
    //MARK: -Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -Hnalder
    
    //TODO: TableView Datasource Module
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    //TODO: TableView Delegate Module
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

