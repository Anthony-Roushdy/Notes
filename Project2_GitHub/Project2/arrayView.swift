//
//  arrayView.swift
//  Project2
//
//  Created by Anthony Roushdy on 12/6/23.
//

import SwiftUI

struct arrayView: View {
    var object: Object
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(object.name)
                    .font(.headline)
                Text(object.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Created on: \(formattedDate(date: object.creationDate))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(10)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    private func formattedDate(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
}

struct arrayView_Previews: PreviewProvider {
    static var previews: some View 
    {
        arrayView(object: Object(name: "Sample Name", description: "Sample Description", creationDate: Date()))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
