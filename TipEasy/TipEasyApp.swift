//
//  TipEasyApp.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/7/25.
//

import SwiftData
import SwiftUI

@main
struct TipEasyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Employee.self)
    }
}
