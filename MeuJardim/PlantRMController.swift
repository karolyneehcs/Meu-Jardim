//
//  PlantRMController.swift
//  MeuJardim
//
//  Created by Cristiano Coutinho on 10/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit

class PlantRMController: UIViewController{
    
    @IBOutlet weak var imagePickerButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var popularPlantField: UITextField!
    
    @IBOutlet weak var scientificPlantField: UITextField!
    
    var imagePicker:ImagePicker!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          self.imagePicker = ImagePicker(presentationController: self, delegate: self)
          
      }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        
        self.imagePicker.present(from: sender)
    }
    
}

extension PlantRMController: ImagePickerDelegate {
     func didSelect(image: UIImage?) {
           guard let image = image else {
               return
           }
           self.imageView.image = image
       }
}
