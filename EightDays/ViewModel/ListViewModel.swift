//
//  ListViewModel.swift
//  EightDays
//
//  Created by Midhuhath Ibrahim on 12/13/24.
//

import Foundation

/*
 
 CRUD FUNCTIONS
 
 CREATE
 READ
 UPDATE
 DELETE
 
 */



class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            savedItems()
        }
    }
    
    
    let itemsKey: String = "itemsKey"
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        //        let newTask = [
        //            TaskModel(title: "Get groceries", isCompleted: false),
        //            TaskModel(title: "Get laundry done", isCompleted: false),
        //            TaskModel(title: "Take out trash", isCompleted: false),
        //            TaskModel(title: "Call back office", isCompleted: true)
        //    ]
        //        tasks.append(contentsOf: newTask)
        
        guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let savedItems = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.tasks = savedItems
    }
    
    func deleteTask(index: IndexSet) {
        tasks.remove(atOffsets: index)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func addTask(title: String) {
        tasks.append(TaskModel(title: title, isCompleted: false))
    }
    
    func updateTask(task: TaskModel) {
        
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task.updateCompletion()
        }
        
    }
    
    func savedItems() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: itemsKey)
        }
    }
    
}
