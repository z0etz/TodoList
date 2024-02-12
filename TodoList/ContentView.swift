//
//  ContentView.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    @State var name = ""
//    @State var id = 0
//    @State var isCompleted = false
//    @State var todoItems = [
//        TodoItem(title: "Somna", isCompleted: true),
//        TodoItem(title: "Vakna", isCompleted: true)
//    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Katjas todo-app")
                List {
                    ForEach(viewModel.tasks) { entity in
                        VStack {
                            Text(entity.name ?? "empty task")
                            Button("Uppdatera") {
                                viewModel.updateTask(task: entity, newName: name)
                            }
                        }
                    }
                }
                .padding()
                TextField("Ny uppgift", text: $name)
                    .padding()
                Button("Lägg till uppgift") {
                    buttonFunction()
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            }
            .padding()
    }
        
    
    func buttonFunction() {
        if name.isEmpty {
            return
        }
        viewModel.addTask(name: name)
        name = ""
    }
}


#Preview {
    ContentView(viewModel: TaskViewModel())
}
