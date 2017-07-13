//
//  TaskRowTableViewController.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit

class TaskRowTableViewController: UITableViewController {
    
    var taskArrays = [Task]()
    private let displayManager = TodoListDataDisplayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = displayManager
        tableView.delegate = displayManager
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        let firstTask = Task(name: "My first task", descr: "Some description")
        let secondTask = Task(name: "My second task", descr: "Some description")
        let thirdTask = Task(name: "My third task", descr: "Some description")
        
        displayManager.setupWithTasks([firstTask, secondTask, thirdTask])
        tableView.reloadData()
    }
    
    // MARK: IBActions
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "oneSegue", sender: nil)
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
}
