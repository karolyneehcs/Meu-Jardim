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
    
    
    var plantImageInit = ""
    var generalCommentUserInit = ""
    var habitatCommentUserInit = ""
    var scientificNameUserInit = ""
    var commonNameUserInit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Information"
        generalComment.text = "General Comments"
        habitatComment.text = "Habitat Comments"
        commonName.text = "Common Name"
        scientificName.text = "Scientific Name"
        let imagePath = FileHelper().constructPath(named: "photos/" + (plantImageInit))
        plantImage.image = UIImage(contentsOfFile: imagePath.relativePath)
        generalCommentUser.text = generalCommentUserInit
        habitatCommentUser.text = habitatCommentUserInit
        scientificNameUser.text = scientificNameUserInit
        commonNameUser.text = commonNameUserInit
        
        // Do any additional setup after loading the view.
    }
    override func willMove(toParent parent: UIViewController?) {
         navigationItem.largeTitleDisplayMode = .always
         navigationController?.navigationBar.prefersLargeTitles = true
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
