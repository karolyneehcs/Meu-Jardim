//
//  InfoViewController.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 27/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var generalCommentUser: UILabel!
    @IBOutlet weak var generalComment: UILabel!
    @IBOutlet weak var habitatCommentUser: UILabel!
    @IBOutlet weak var habitatComment: UILabel!
    @IBOutlet weak var scientificNameUser: UILabel!
    @IBOutlet weak var scientificName: UILabel!
    @IBOutlet weak var commonNameUser: UILabel!
    @IBOutlet weak var commonName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
