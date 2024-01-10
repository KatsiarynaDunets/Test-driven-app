//
//  Test_driven_appApp.swift
//  Test-driven-app
//
//  Created by Kate on 10/01/2024.
//

import SwiftUI

@main
struct Test_driven_appApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
