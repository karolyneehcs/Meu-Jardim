//
//  Plant.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 16/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation

class Plant: RepositoryItem{
    
    var id: UUID
    var popularName: String?
    var scientificName: String?
    var photo: URL?
    var information: String?
    
    required init() {
        self.id = UUID()
        self.popularName = nil
        self.scientificName = nil
        self.photo = nil
        self.information = nil
    }
}
