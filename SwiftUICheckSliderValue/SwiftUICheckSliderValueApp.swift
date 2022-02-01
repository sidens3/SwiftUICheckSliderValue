//
//  SwiftUICheckSliderValueApp.swift
//  SwiftUICheckSliderValue
//
//  Created by Михаил Зиновьев on 01.02.2022.
//

import SwiftUI

@main
struct SwiftUICheckSliderValueApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currentValue: .constant(Double(50)))
        }
    }
}
