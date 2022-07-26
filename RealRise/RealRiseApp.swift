//
//  RealRiseApp.swift
//  RealRise
//
//  Created by Michelle Nathania on 26/07/22.
//

import SwiftUI

@main
struct RealRiseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
