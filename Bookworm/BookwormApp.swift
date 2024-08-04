//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Günseli Ünsal on 2.08.2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
