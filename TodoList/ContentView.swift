//
//  ContentView.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    @State var task = ""
    @State var todoItems = [
        TodoItem(title: "Somna", isCompleted: true),
        TodoItem(title: "Vakna", isCompleted: true)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Katjas todo-app")
            List {
                ForEach(todoItems) { item in
                    TodoItemView(todoItem: item, todoItems: $todoItems)
                }
            }
            .padding()
            TextField("Ny uppgift", text: $task)
                .padding()
            Button("Lägg till uppgift") {
                buttonFunction()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        
        }
        .padding()
    }
    
    func buttonFunction() {
        todoItems.append(TodoItem(title: task, isCompleted: false))
        task = ""
    }
}


#Preview {
    ContentView()
}
