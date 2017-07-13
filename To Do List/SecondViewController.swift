//
//  SecondViewController.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit
import os.log



class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var indexNumber: Int?

    @IBOutlet weak var switchElement: UISwitch!
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    var name = ""
    var descript = ""
    var needsDelete: Bool?
    
    
    @IBAction func nameChanged(_ sender: UITextField) {
        name = sender.text!
    }
    @IBAction func descriptionChanged(_ sender: UITextField) {
        descript = sender.text!
    }
    
    
    var task: Task?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.dataSource = self
        
        if task == nil {
            switchElement.isHidden = true
            taskLabel.isHidden = true
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifierName = "NameTableViewCell"
        let cellIdentifierDescription = "DescriptionTableViewCell"
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierName, for: indexPath) as? NameTableViewCell
                else {
                fatalError("The dequeued cell is not an instance of TaskRowTableViewCell.")
            }
            
            cell.configureWith(name)

            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifierDescription, for: indexPath) as? DescriptionTableViewCell
                else {
                fatalError("The dequeued cell is not an instance of TaskRowTableViewCell.")
            }
            
            cell.configureWith(descript)

            return cell
        
        }

        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)

        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
            
            
        }
        
        
        
        if (name != "") && (descript != "") && (!switchElement.isOn) {
            if (task == nil) {
                task = Task(name: name, descr: descript)
            } else {
                task!.nameOfTask = name
                task!.descriptionOfTask = descript
               }
           
        } else if ((task != nil) && (name == "") && (descript == "")) || ((task != nil) && (switchElement.isOn)) {
            needsDelete = true
        }

    }
    
    

}


