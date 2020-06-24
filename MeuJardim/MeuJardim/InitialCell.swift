//
//  File.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 11/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class InitialCell : UITableViewCell {
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantName: UILabel!
      
    override func awakeFromNib() {
        self.plantImage.layer.cornerRadius = plantImage.frame.width/2
    }
}
