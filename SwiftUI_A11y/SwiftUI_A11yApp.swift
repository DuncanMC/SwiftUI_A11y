//
//  SwiftUI_A11yApp.swift
//  SwiftUI A11y
//
//  Created by Duncan Champney on 9/26/24.
//

import SwiftUI

enum CurrentA11yFocus: Int, Hashable, CaseIterable {
    case button
    case field1
    case field2
    case field3
    static func randomElement() -> AllCases.Element {
        return Self.allCases.randomElement()!
    }
}

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
