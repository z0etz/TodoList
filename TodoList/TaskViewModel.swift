//
//  TaskViewModel.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-12.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    var container = Persistence.shared.container
    
    init() {
        self.fetchTasks()
    }
    
    func fetchTasks() {
        let request = NSFetchRequest<Task>(entityName: "Task")
        
        do {
            tasks = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetching: \(error)")
        }
    }
    
    func addTask(name: String) {
        print("task added")
        let newTask = Task(context: container.viewContext)
        newTask.name = name
        newTask.isCompleted = false
        newTask.id = UUID()
        saveData()
    }
    
    func updateTask(task: Task, newName: String) {
        task.name = newName
        
        do {
            try container.viewContext.save()
            print("task updated")
        } catch let error {
            print("Error saving task: \(error)")
        }
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("error saving data \(error)")
        }
        fetchTasks()
    }
    
}
