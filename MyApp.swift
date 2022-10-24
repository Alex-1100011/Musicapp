import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                ContentView()
                    .environment(\.geometry, CGSize(
                        width: geometry.size.width,
                        height: geometry.size.height)
                    )
            }
        }
    }
}
