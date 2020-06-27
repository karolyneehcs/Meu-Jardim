//
//  NatureServe.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 26/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation

class NatureServe{
    
    func pesquisar(searchText : String) {
        let path: String = "https://explorer.natureserve.org/api/data/speciesSearch"
        let url: URL = URL(string: path)!
        //Post
        let body : Search = Search(criteriaType: "species", textCriteria: [[ "paramType" : "quickSearch", "searchToken" : searchText]], statusCriteria: [], locationCriteria: [], pagingOptions: ["page" : "", "recordsPerPage":""], recordSubtypeCriteria: [], modifiedSince: "", speciesTaxonomyCriteria: [["paramType" : "scientificTaxonomy","level" : "KINGDOM","scientificTaxonomy" : "Plantae"]])
        
        
        if let jsonData = try? JSONEncoder().encode(body) {
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
            urlRequest.httpBody = jsonData
            
            URLSession.shared.uploadTask(with: urlRequest, from: jsonData){ data, response, error  in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                        if let results = json["results"] as? [[String :Any ]]{
                            
                            for dict in results{
                                for (key, value) in dict{
                                    if key == "uniqueId"{
                                        self.get(id: value as!String)
                                    }
                                }
                                break
                            }
                        }
                    }
                }catch let error as NSError{
                    print("Failed to load: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    
    func get(id: String) {
        let path: String =  "https://explorer.natureserve.org/api/data/taxon/"  + id
        let url: URL = URL(string: path)!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                    if let characteristics = json["speciesCharacteristics"] as? [String : Any]{
                        for (key, value) in characteristics{
                            if key == "habitatComments"{
                                print(value)
                            }
                        }
                    }
                    
                }
            }catch let error as NSError{
                print("Failed to load: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
}
