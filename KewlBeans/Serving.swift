//
//  Serving.swift
//  KewlBeans
//
//  Created by admin on 2/5/22.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffine: Int
    let calories: Int
}
