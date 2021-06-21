//
//  TodoItem.swift
//  to-do-list
//
//  Created by alex on 2021/4/28.
//

import SwiftUI
import AVFoundation

struct TodoItem: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var todo: Todo
    
    let systemSoundID: SystemSoundID = 1035
    
    static let Formatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      return formatter
    }()
    
    static let now = Date()
    
    var body: some View {
        if todo.name != nil {
            NavigationLink(destination: TodoDetail(todo: todo)) {
                HStack {
                    Button(action: {
                        updateItem(item: todo)
                    }, label: {
                        if todo.isComplete == true {
                            Image(systemName: "largecircle.fill.circle")
                                .padding(.leading)
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "circle")
                                .padding(.leading)
                        }

                    })
                    VStack(alignment: .leading) {
                        if todo.isComplete == true {
                            Text(todo.name!)
                                .strikethrough()
                                .font(.headline)
                        } else {
                            Text(todo.name!)
                                .font(.headline)
                        }
                        if TodoItem.now > todo.expireDate! {
                            Text(TodoItem.Formatter.string(from: todo.expireDate!))
                                .font(.caption)
                                .foregroundColor(.red)
                        } else {
                            Text(TodoItem.Formatter.string(from: todo.expireDate!))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                    }
                                        
                    Spacer()
                }
            }
            .animation(Animation.spring())
            
        }

    }
    
    func updateItem(item: Todo) {
        let newStatus = !item.isComplete
        if item.isComplete == false {
            AudioServicesPlaySystemSound (systemSoundID)
        }
        managedObjectContext.performAndWait {
            item.isComplete = newStatus
            try? managedObjectContext.save()
        }
    }
}

/*
struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        TodoItem()
    }
}
*/
