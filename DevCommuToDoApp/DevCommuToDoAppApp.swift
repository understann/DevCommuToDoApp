//
//  DevCommuToDoAppApp.swift
//  DevCommuToDoApp
//
//  Created by Nattapon Howong on 22/5/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct DevCommuToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
