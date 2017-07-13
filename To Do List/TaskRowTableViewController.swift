//
//  TaskRowTableViewController.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit

class TaskRowTableViewController: UITableViewController {
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "oneSegue", sender: nil)
    }
    
    var taskArrays = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.leftBarButtonItem = editButtonItem
    

        
    }

    override func didReceiveMemoryWarning() {
        
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArrays.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TaskRowTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskRowTableViewCell else {
                fatalError("The dequeued cell is not an instance of TaskRowTableViewCell.")
        }
        
        let taskName = taskArrays[indexPath.row]
        
        cell.nameLabel.text = taskName.nameOfTask
        cell.descriptionLabel.text = taskName.descriptionOfTask
        
 
    

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskArrays[indexPath.row]
        performSegue(withIdentifier: "oneSegue", sender: task)
    }
 
    @IBAction func unwindToTaskRows(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SecondViewController, let task = sourceViewController.task {
            
            if let indexOfRow = sourceViewController.indexNumber {
                
                taskArrays[indexOfRow] = task
                
                if sourceViewController.needsDelete != nil {
                    taskArrays.remove(at: indexOfRow)
                }
            
            
            
        } else {
            let newIndexPath = IndexPath(row: taskArrays.count, section: 0)
            taskArrays.append(task)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
        }
        
        
        self.tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "oneSegue", let destinationVC = segue.destination as? SecondViewController {
            
            if let task = sender as? Task {
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let indexPathValue = indexPath.row
                    destinationVC.indexNumber = indexPathValue
                }
                
                destinationVC.task = task
                destinationVC.name = task.nameOfTask
                destinationVC.descript = task.descriptionOfTask
            
            }
        }
    }
    
    
  

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            taskArrays.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    

}
