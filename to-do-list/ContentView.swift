//
//  ContentView.swift
//  to-do-list
//
//  Created by alex on 2021/4/25.
//

import SwiftUI
import CoreData

struct ContentView: View {


    var body: some View {
        ZStack {
            TodoList()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
