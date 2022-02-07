//
//  MenuSection.swift
//  KewlBeans
//
//  Created by admin on 2/4/22.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
    
    func matches(for search: String) -> [Drink] {
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return drinks }
        
        return drinks.filter {
            $0.name.localizedCaseInsensitiveContains(trimmed) }
    }
}
