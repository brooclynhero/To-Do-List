//
//  DescriptionCell.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionField: UITextField!
    
    func configureWith(_ name: String) {
        descriptionField.text = name
    }
}
