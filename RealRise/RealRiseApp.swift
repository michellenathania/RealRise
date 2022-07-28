import SwiftUI

@main
struct RealRiseApp: App {
    @StateObject private var dc = DataController()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, dc.container.viewContext)
        }
    }
}
