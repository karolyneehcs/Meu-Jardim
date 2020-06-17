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
        setNavBar()
        setKeyboardBehavior()
    }
    // MARK: - When user go back to parent page the navbar will be changed
    override func willMove(toParent parent: UIViewController?) {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    //MARK: - Saves the new plant in a file
    @objc func saveTapped(_sender: UINavigationItem){
        let plantRepository = PlantRepository()
        let plant : Plant = plantRepository.createNewItem() ?? Plant()
        plant.popularName = popularPlantField.text
        plant.scientificName = scientificPlantField.text
        plantRepository.update(item: plant)
        print(plantRepository.readAllItems())
    }
    
    
    //MARK: - Keyboard actions
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

extension PlantRMController{
    func setNavBar(){
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Cadastrar nova planta"
        
    }
    func setKeyboardBehavior(){
        // shows keyboard when user selects text field
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        // add gesture recognizer in view so when user taps the keyboard is dismissed
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard)))
    }
}

