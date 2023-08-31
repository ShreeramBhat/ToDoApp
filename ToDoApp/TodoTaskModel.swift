//
//  TodoTask.swift
//  ToDoApp
//
//  Created by Shreeram Bhat on 31/08/23.
//

import Foundation

enum Priority: Int, RawRepresentable {
    case high = 100
    case medium = 50
    case low = 25
}

struct TodoTaskModel {
    
    let title: String
    let description: String?
    let priority: Priority
    let isDone: Bool
    
}
