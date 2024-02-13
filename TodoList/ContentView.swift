//
//  ContentView.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TaskViewModel()
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Katjas todo-app")
                
                List {
                    ForEach($viewModel.tasks) { item in
                        TaskItemView(task: item, viewModel: viewModel, editingName: $name)
                    }
                }
                .padding()
                Spacer()
                TextField("Ny uppgift / Nytt namn", text: $name)
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
