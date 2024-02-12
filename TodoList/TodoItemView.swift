//
//  TodoItemView.swift
//  TodoList
//
//  Created by Katja Klahr on 2024-02-07.
//

import SwiftUI

struct TodoItemView: View {
    
    @State var todoItem: TodoItem
    @Binding var todoItems: [TodoItem]
    
    var body: some View {
        
        HStack {
            Text(todoItem.title)
            Spacer()
            Image(systemName: todoItem.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    self.todoItem.isCompleted.toggle()
                }
                .padding()
            Image(systemName: "trash")
                .onTapGesture {
                    if let index = todoItems.firstIndex(of: todoItem) {
                               todoItems.remove(at: index)
                           }

                }
            }
        .padding()
    }
}

//#Preview {
//    TodoItemView(todoItem: TodoItem(title: "Title", isCompleted: true), todoItems: <#Binding<[TodoItem]>#>)
//}

