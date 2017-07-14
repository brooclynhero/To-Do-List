//
//  TodoListDataDisplayManager.swift
//  To Do List
//
//  Created by Philip Alekhin on 13/07/2017.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit

protocol TodoListDataDisplayManagerDelegate: class {
    func didSelectTask(_ task: Task)
}

class TodoListDataDisplayManager: NSObject {
    
    weak var delegate: TodoListDataDisplayManagerDelegate?
    var tasks: [Task] = []
    
    func setupWithTasks(_ tasks: [Task]) {
        self.tasks = tasks
    }
}

// MARK: UITableViewDataSource

extension TodoListDataDisplayManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TaskRowTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? TaskRowTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskRowTableViewCell.")
        }
        
        let task = tasks[indexPath.row]
        cell.setupWithTask(task)
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension TodoListDataDisplayManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        delegate?.didSelectTask(task)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
