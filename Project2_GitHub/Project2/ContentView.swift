//
//  ContentView.swift
//  Project2
//
//  Created by Anthony Roushdy on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var objectview = ObjectView()
    @State private var showingAddSheet = false
    @State private var newNoteTitle = ""
    @State private var newNoteContent = ""
    @State private var isDarkMode = false


    var body: some View 
    {
        NavigationView
        {
            List
            {
                ForEach(objectview.items) { object in
                    NavigationLink(destination: arrayView(object: object))
                    {
                        arrayView(object: object)
                    }
                }
                .onDelete(perform: objectview.deleteNote)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Notes")
            .navigationBarItems(trailing:
                HStack 
                {
                    Toggle(isOn: $isDarkMode)
                    {
                        Text("Dark Mode")
                    }
                    Button(action:
                            {
                                showingAddSheet = true
                            })
                    {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                })
        }
        .sheet(isPresented: $showingAddSheet) {
            newNoteView(objectview: objectview, isPresented: $showingAddSheet)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
