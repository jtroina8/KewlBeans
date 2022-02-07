//
//  Drink.swift
//  KewlBeans
//
//  Created by admin on 2/4/22.
//

import Foundation

struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Drink(id: UUID(), name: "Example Drink", caffine: [60, 120, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}
