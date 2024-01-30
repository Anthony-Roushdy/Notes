//
//  Object.swift
//  Project2
//
//  Created by Anthony Roushdy on 12/6/23.
//

import Foundation

struct Object: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let creationDate: Date
}
