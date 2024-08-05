//
//  AddBookView.swift
//  Bookworm
//
//  Created by Günseli Ünsal on 4.08.2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var genre = "Fantasy"
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Other"]
    
    var body: some View {
        NavigationStack{
            Form{
                //MARK: Movie Details section
                Section("Movie Details"){
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                //MARK: Write a review and rating section
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                //MARK: Save
                Section(){
                    Button(action: {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: .now)
                        
                        modelContext.insert(newBook)
                        dismiss()
                        
                    }, label: {
                        Text("Save")
                    }).disabled(hasValidForm == false)
                }
                
            }
            .navigationTitle("Add Book")
        }
    }
    var hasValidForm: Bool {
        if title.isReallyEmpty || genre.isReallyEmpty || author.isReallyEmpty || review.isReallyEmpty {
            return false
        }

        return true
    }
}

#Preview {
    AddBookView()
}
