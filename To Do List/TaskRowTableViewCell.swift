//
//  TaskRowTableViewCell.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit

class TaskRowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setupWithTask(_ task: Task) {
        nameLabel.text = task.nameOfTask
        descriptionLabel.text = task.descriptionOfTask
    }
}
