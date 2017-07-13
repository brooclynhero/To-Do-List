//
//  TaskClass.swift
//  To Do List
//
//  Created by Кирилл Макаренко on 11.07.17.
//  Copyright © 2017 Kirill Makarenko. All rights reserved.
//

import Foundation

struct Task {
    
    var nameOfTask: String
    var descriptionOfTask: String

    init(name: String, descr: String) {
        nameOfTask = name
        descriptionOfTask = descr
    }
}
