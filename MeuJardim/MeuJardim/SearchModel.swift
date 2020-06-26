//
//  SearchModel.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 26/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation

struct Search: Encodable{
    
    var criteriaType : String
    var textCriteria : [[String:String]]
    var statusCriteria : [String]
    var locationCriteria : [String]
    var pagingOptions : [String:String]
    var recordSubtypeCriteria : [String]
    var modifiedSince : String
    var speciesTaxonomyCriteria : [[String:String]]
}
