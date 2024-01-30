//
//  ObjectView.swift
//  Project2
//
//  Created by Anthony Roushdy on 12/6/23.
//

import Foundation

class ObjectView: ObservableObject 
{
    @Published var items: [Object] = []
    
    init() {
        loadNotes();
    }

        func addNote(title: String, content: String) {
            let newItem = Object(name: title, description: content, creationDate: Date())
            items.append(newItem)
            saveNotes()
        }

        func deleteNote(indexSet: IndexSet) {
            items.remove(atOffsets: indexSet)
            saveNotes()
        }
    
    private let notesKey = "notes"
    
    private func saveNotes() 
    {
        do
        {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: notesKey)
        } catch
        {
            print("Error encoding notes: \(error.localizedDescription)")
        }
    }

    private func loadNotes() {
        if let data = UserDefaults.standard.data(forKey: notesKey) 
        {
            do 
            {
                items = try JSONDecoder().decode([Object].self, from: data)
            } catch
            {
                print("Error decoding notes: \(error.localizedDescription)")
            }
        }
    }
}
