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
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Katjas todo-app")
                    .padding()
                
                List {
                    ForEach(viewModel.tasks) { entity in
                        HStack {
                            VStack {
                                Text(entity.name ?? "empty task")
                                HStack {
                                    Spacer()
                                    Text("Uppdatera")
                                        .onTapGesture  {
                                        viewModel.updateTask(task: entity, newName: name)
                                    }
                                    .padding()
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    Text("Ta bort")
                                        .onTapGesture {
                                            viewModel.deletTask(entity: entity)
                                        }
                                    .padding()
                                    .background(.pink)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        
                    }
                }
                .padding()
                Spacer()
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
