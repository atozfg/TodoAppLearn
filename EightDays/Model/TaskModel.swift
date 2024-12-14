//
//  TaskModel.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskModel {
        return TaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
