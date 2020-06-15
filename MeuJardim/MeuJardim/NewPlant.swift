//
//  NewPlant.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 12/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class NewPlant: UIViewController {
    
//    @IBOutlet weak var descriptionManualButton: UILabel!
    @IBOutlet weak var sugestion: UIButton!
//    @IBOutlet weak var descriptionSugestionButton: UILabel!
    @IBOutlet weak var manual: UIButton!
    
    
    func setManualButton(){
        manual.tintColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 1)
        manual.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7333333333, alpha: 1)
        manual.layer.cornerRadius = 15
        manual.setTitle("Manual", for: .normal)
        manual.titleLabel?.font = .systemFont(ofSize: 22)
//        let icon = UIImage(named: "pencil")!
//        manual.setImage(icon, for: .normal)
//        manual.imageView?.contentMode = .scaleAspectFit
//        manual.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    }
    func setSugestionButton(){
        sugestion.tintColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 1)
        sugestion.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.7960784314, blue: 0.7333333333, alpha: 1)
        sugestion.layer.cornerRadius = 15
        sugestion.setTitle("Sugestão", for: .normal)
        sugestion.titleLabel?.font = .systemFont(ofSize: 22)
    }
    override func viewDidLoad() {
        setManualButton()
        setSugestionButton()
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Nova planta"
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
