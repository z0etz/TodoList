//
//  TaskItemView.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-13.
//

import SwiftUI

struct TaskItemView: View {
    
    @Binding var task: Task
    @ObservedObject var viewModel: TaskViewModel
    @Binding var editingName: String
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    task.isCompleted.toggle()
                    viewModel.saveData()
                }
            Text(task.name ?? "")
            Spacer()
            Image(systemName: "pencil")
                .onTapGesture {
                    viewModel.updateTask(task: task, newName: editingName)
                    editingName = ""
                }
                .padding()
            Image(systemName: "trash")
                .onTapGesture {
                    viewModel.deleteTask(entity: task)
                }
            }
    }
}


//#Preview {
//    TaskItemView()
//}
