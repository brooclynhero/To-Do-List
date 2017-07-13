//
//  NameCell.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit



class NameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameField: UITextField!
    
    
    
    
    
    func configureWith(_ name: String) {
        nameField.text = name
    }
    
    
    
}
