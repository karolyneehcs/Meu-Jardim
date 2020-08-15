//
//  PlantCharacteristicModel.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 26/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation

struct SpeciesCharacteristics{
    var elementGlobalId: String
    var reproductionComments: String
    var ecologyComments: String
    var habitatComments: String
    var generalDescription: String
    var diagnosticCharacteristics: [String]
    var speciesMarineHabitats: [String]
    var speciesTerrestrialHabitats: [String]
    var speciesRiverineHabitats: [String]
    var speciesPalustrineHabitats: [String]
    var speciesLacustrineHabitats: [String]
    var speciesSubterraneanHabitats: [String]
    var speciesEstuarineHabitats:[String]
}

extension SpeciesCharacteristics {
    init?(json: [String: Any]) {
        guard let elementGlobalId = json["elementGlobalId"] as? String,
            let reproductionComments = json["reproductionComments"] as? String,
            let ecologyComments = json["ecologyComments"] as? String,
            let habitatComments = json["habitatComments"] as? String,
            let generalDescription = json["generalDescription"] as? String,
            let diagnosticCharacteristics = json["diagnosticCharacteristics"] as? [String],
            let speciesMarineHabitats = json["speciesMarineHabitats"] as?  [String],
            let speciesTerrestrialHabitats = json["speciesTerrestrialHabitats"] as?  [String],
            let speciesRiverineHabitats = json["speciesRiverineHabitats"] as?  [String],
            let speciesPalustrineHabitats = json["speciesPalustrineHabitats"] as?  [String],
            let speciesLacustrineHabitats = json["speciesLacustrineHabitats"] as?  [String],
            let speciesSubterraneanHabitats = json["speciesSubterraneanHabitats"] as?  [String],
            let speciesEstuarineHabitats = json["speciesEstuarineHabitats"] as? [String]
            else {
                return nil
        }
        self.elementGlobalId = elementGlobalId
        self.reproductionComments = reproductionComments
        self.ecologyComments = ecologyComments
        self.habitatComments = habitatComments
        self.generalDescription = generalDescription
        self.diagnosticCharacteristics = diagnosticCharacteristics
        self.speciesMarineHabitats = speciesMarineHabitats
        self.speciesTerrestrialHabitats = speciesTerrestrialHabitats
        self.speciesRiverineHabitats = speciesRiverineHabitats
        self.speciesPalustrineHabitats = speciesPalustrineHabitats
        self.speciesLacustrineHabitats = speciesLacustrineHabitats
        self.speciesSubterraneanHabitats = speciesSubterraneanHabitats
        self.speciesEstuarineHabitats = speciesEstuarineHabitats
    }
}
