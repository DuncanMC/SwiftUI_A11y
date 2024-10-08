//
//  ContentView.swift
//  SwiftUI A11y
//
//  Created by Duncan Champney on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appObject: AppObject
    @AccessibilityFocusState var currentA11yFocus: CurrentA11yFocus?
//    @AccessibilityFocusState(for: [.switchControl, .voiceOver]) var currentA11yFocus: CurrentA11yFocus?

    @State var string1: String = "String 1"
    @State var string2: String = "String 2"
    @State var string3: String = "String 3"
    var focusString: String {
        return currentA11yFocus.map { String(describing:$0) } ?? "NIL"
    }
    
    func focusString(for a11yFocus: CurrentA11yFocus?) -> String {
        a11yFocus.map {  String(describing: $0) } ?? "NIL"
    }
    
    var array = Array(1...5)
    var body: some View {
        VStack {
            VStack {
                Text("Main header")
                Spacer()
                    .frame(height: 100)
                ProductDetailsHeaderView()
            }
            Button("Switch a11y focus") {
                appObject.message = "A11y button tapped."
                
                print("button tapped")
                print("old currentA11yFocus was \(focusString)")
                //
                //
                //
                if currentA11yFocus == nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                        currentA11yFocus = .field1
                        print("currentA11yFocus set to \(focusString)")
                    }
                } else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                        currentA11yFocus = CurrentA11yFocus(rawValue: Int.random(in: 1...3))
                        print("----> Set a11y focus to random value \(focusString) <----")
                    }
                }
            }
            .accessibilityFocused($currentA11yFocus, equals: .button)
            
            TextField("Field 1", text: $string1)
                .accessibilityFocused($currentA11yFocus, equals: .field1)
                .border(.gray)
            TextField("Field 2", text: $string2)
                .accessibilityFocused($currentA11yFocus, equals: .field2)
                .border(.gray)
            TextField("Field 3", text: $string3)
                .accessibilityFocused($currentA11yFocus, equals: .field3)
                .border(.gray)
            
        }
        .padding(5.0)
        .onChange(of: currentA11yFocus) {
            print("In OnChange. changed currentA11yFocus to \(focusString)")
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                currentA11yFocus = .field2
                print("In .onAppear(), Set currentA11yFocus to \(focusString)")
            }
        }
        .padding()
        Spacer()
        Text(appObject.message)
    }
}

#Preview {
    ContentView()
}
