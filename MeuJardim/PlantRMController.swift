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
        FileHelper().removeAllFilesFromDirectory(directoryName: "tempPhotos")
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    //MARK: - Saves the new plant in a file
    @objc func saveTapped(_sender: UINavigationItem){
        var searchText: String = ""
        let plantRepository = PlantRepository()
        let plant = plantRepository.createNewItem() ?? Plant()
        // get contents of tempPhoto which is a directory where the photo is
        let contents = FileHelper().contentsForDirectory(atPath: "tempPhotos")
        plant.photo = contents.first
        plant.popularName = popularPlantField.text
        plant.scientificName = scientificPlantField.text
        
        if scientificPlantField.text != "" && scientificPlantField != nil{
            searchText = searchText + (plant.scientificName!)
        }else{
            searchText = searchText + (plant.popularName!)
        }
        
        
        FileHelper().moveFileNewDirectory(at: FileHelper().constructPath(named: "tempPhotos" + "/" + (plant.photo ?? "")), directoryNamed: "photos")
        let api = NatureServe()
        // this function needs to be reorganized is too long
        api.pesquisar(searchText: searchText, completion:{ results in
            for dict in results{
                for (key, value) in dict{
                    if key == "scientificName"{
                        plant.scientificName = value as? String
                        plantRepository.update(item: plant)
                    }
                    if key == "uniqueId"{
                        api.get(id: value as!String, completionGet: {characteristics in
                            for (key, value) in characteristics{
                                if key == "habitatComments"{
                                    if value as? String == nil{
                                        plant.habitatComments = "Sorry, we  don't have this information yet."
                                        plantRepository.update(item: plant)
                                    } else{
                                        plant.habitatComments = value as? String
                                        plantRepository.update(item: plant)
                                    }
                                }
                                if key == "generalDescription"{
                                    if value as? String == nil{
                                        plant.generalComments = "Sorry, we don't have this information yet."
                                        plantRepository.update(item: plant)
                                    } else{
                                        plant.generalComments = value as? String
                                        plantRepository.update(item: plant)
                                    }
                                    
                                }
                            }
                            
                        })
                    }
                    
                }
                break
            }
        })
        plantRepository.update(item: plant)
        // move the choosen photo to a permanent directory
        
        
        // go back to table previous screen
        let storyboard = UIStoryboard(name: "InitialView", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "InitialView") as UIViewController
        self.navigationController?.pushViewController(nextView, animated: true)
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
        navigationItem.title = "Register splant"
        
    }
    func setKeyboardBehavior(){
        // shows keyboard when user selects text field
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        // add gesture recognizer in view so when user taps the keyboard is dismissed
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard)))
    }
}

