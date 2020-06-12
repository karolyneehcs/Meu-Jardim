//
//  NewPlant.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 12/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class NewPlant: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
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
