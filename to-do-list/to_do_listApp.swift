//
//  to_do_listApp.swift
//  to-do-list
//
//  Created by alex on 2021/4/25.
//

import SwiftUI

@main
struct to_do_listApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
