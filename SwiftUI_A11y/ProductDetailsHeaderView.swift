//
//  ProductDetailsHeaderView.swift
//  SwiftUI A11y
//
//  Created by Duncan Champney on 9/26/24.
//

import Foundation
import SwiftUI

struct ProductDetailsHeaderView: View {
    @EnvironmentObject var appObject: AppObject

    var body: some View {
            VStack {
                Text("Available balance")
                Text("$1234.56")
                Spacer()
                    .frame(height: 20)
                Button(action: {
                    let message = "Main button tapped"
                    print(message)
                    appObject.message = message
                }
                ) {
                    Text("Click me")
                }
                Button(action: {
                    let message = ""
                    appObject.message = message
                }
                ) {
                    Text("Clear message")
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 1)
                        )
                }
                Color.clear
                    .contentShape(Rectangle())
                    .accessibilityElement()
                    .accessibilityLabel("Double-tap to activate")
                    .frame(width: 0, height: 0)
            }
        .fixedSize(horizontal: true, vertical: true)
        .accessibilityElement(children: .combine)
        .padding()
        .border(.cyan)
    }
}

#Preview {
    ProductDetailsHeaderView()
}
