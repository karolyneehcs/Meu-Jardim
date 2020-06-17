//
//  RepositoryPlant.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 16/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation
//MARK: - Repository Methods are used indirectly from Plant Repository
class PlantRepository: RepositoryMethods {
    typealias Item = Plant
    var items: [Plant] = []
}
