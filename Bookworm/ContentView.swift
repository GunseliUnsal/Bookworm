//
//  ContentView.swift
//  Bookworm
//
//  Created by Günseli Ünsal on 2.08.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            Text("Count: \(books.count)")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add Book", systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
    }
}

#Preview {
    ContentView()
}
