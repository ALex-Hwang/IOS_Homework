//
//  TodoList.swift
//  to-do-list
//
//  Created by alex on 2021/4/28.
//

import SwiftUI

struct TodoList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: Todo.entity(),
      sortDescriptors: [
        NSSortDescriptor(keyPath: \Todo.expireDate, ascending: true)
      ]
    )
    private var items: FetchedResults<Todo>

    @State var isPresented: Bool = false
    @State private var showCompleted = false
    
    var filteredTodos: [Todo] {
        items.filter { item in
            (!showCompleted||item.isComplete==true)
        }
    }
    
    private var date = Date()
    var body: some View {
        NavigationView {
            List {
                
                ForEach(filteredTodos, id: \.createDate) { item in
                        TodoItem(todo: item)
                }
                .onDelete(perform: deleteItem)
                .buttonStyle(BorderlessButtonStyle())
            }
            .sheet(isPresented: $isPresented) {
                AddItem()
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(leading:
                                    Button(action: {
                                        showCompleted = !showCompleted
                                    }, label: {
                                        if showCompleted == true {
                                            Text("Completed")
                                        } else {
                                            Text("All")
                                        }
                                    }),
                                trailing:
                                    Button(action: {isPresented = true}, label: {
                                        Image(systemName: "plus.circle")
                                    }))
            /*
            .navigationBarItems(leading:
                                    Toggle(isOn: $showCompleted) {
                                        Text("Completed")
                                    })
             */
        }
    }
    func fullfil(item: Todo) {
        let newStatus = !item.isComplete
        managedObjectContext.performAndWait {
            item.isComplete = newStatus
            try? managedObjectContext.save()
        }
    }
    

    
    func deleteItem(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(managedObjectContext.delete)
            saveContext()
        }
    }
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}

