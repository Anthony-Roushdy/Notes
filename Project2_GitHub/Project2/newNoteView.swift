//
//  newNoteView.swift
//  Project2
//
//  Created by Anthony Roushdy on 12/6/23.
//

import SwiftUI

struct newNoteView: View {
    @ObservedObject var objectview: ObjectView
    @Binding var isPresented: Bool
    @State private var noteTitle = ""
    @State private var noteContent = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Title").foregroundColor(.blue)) {
                    TextField("Enter title", text: $noteTitle).textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section(header: Text("Note Content").foregroundColor(.blue)) {
                    TextEditor(text: $noteContent)
                        .frame(minHeight: 100)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
            }
            .navigationTitle("Add Note")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    objectview.addNote(title: noteTitle, content: noteContent)
                    isPresented = false
                }
                .disabled(noteTitle.isEmpty || noteContent.isEmpty)
            )
        }
    }
}

struct newNoteView_Previews: PreviewProvider {
    static var previews: some View {
        newNoteView(objectview: ObjectView(), isPresented: .constant(true))
    }
}
