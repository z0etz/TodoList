//
//  Todo.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-07.
//

import Foundation

struct TodoItem: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
