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
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Cadastrar nova planta"
        
        // shows keyboard when user selects text field
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        // add gesture recognizer in view so when user taps the keyboard is dismiss
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard)))
        
    }
    
    override func willMove(toParent parent: UIViewController?) {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        
        self.imagePicker.present(from: sender)
    }
    
    @objc func saveTapped(_sender: UINavigationItem){
        
        print("Saved")
    }
    
    //Keyboard
    @objc func keyboardWillShow(sender: NSNotification){
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillHide(sender: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
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
