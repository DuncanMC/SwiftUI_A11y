//
//  SwiftUI_A11yApp.swift
//  SwiftUI A11y
//
//  Created by Duncan Champney on 9/26/24.
//

import SwiftUI


class AppObject: ObservableObject, Equatable {
    @Published var message: String = ""
    static func ==(lhv: AppObject, rhv: AppObject) -> Bool {
        return lhv.message == rhv.message
    }
    
}
@main
struct SwiftUI_A11yApp: App {
    @StateObject var appObject = AppObject()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appObject)
        }
    }
}
