//
//  Persistence.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-12.
//

import Foundation
import CoreData

struct Persistence {
    static let shared = Persistence()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TaskModelCoreData")
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data: \(error)")
            }
            else {
                print("Success!")
            }
            
        }
    }
}
