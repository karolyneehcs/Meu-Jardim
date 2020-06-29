//
//  Initial.swift
//  MeuJardim
//
//  Created by Jhennyfer Rodrigues de Oliveira on 11/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class Initial: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarApearence()
        setSearchBar()
    }
    
    // MARK: - Setting variables
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var plantRepository: PlantRepository {
        PlantRepository()
    }
    var filteredPlants: [Plant] = []
    var plants: [Plant] = []
    let cellIdentifier = "CellIdentifier"
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    //MARK: - Table View Datasource
    //MARK: - Define the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: - Blocks delete action if the user is searching
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if isFiltering {
            return UITableViewCell.EditingStyle.none
        } else {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    //MARK: - Swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            plantRepository.delete(id: plants[indexPath.row].id)
            plants.remove(at: indexPath.row)
            plants = plantRepository.readAllItems()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    
    //MARK: - Return the number of plants to fill the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPlants.count
        }
        return plantRepository.readAllItems().count
    }
    
    //MARK: - Shows the full table view or the search results if user is searching
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InitialCell
        
        plants = plantRepository.readAllItems()
        var plant: Plant
        
        // if user is searching table view will show the results of search
        if isFiltering {
            plant = filteredPlants[indexPath.row]
        } else {
            plant = plants[indexPath.row]
        }
        
        let imagePath = FileHelper().constructPath(named: "photos/" + (plant.photo ?? ""))
        cell.plantImage.image = UIImage(contentsOfFile: imagePath.relativePath)
        cell.plantName.text = plant.popularName
        return cell
    }
    
    //MARK: - Update table view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Calling the repository to read all notes
        plants = plantRepository.readAllItems()
        tableView.reloadData()
    }
    override func willMove(toParent parent: UIViewController?) {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - When user taps the plus button he will be redirect to another screen
    @objc func addTapped(_sender: UINavigationItem){
        let storyboard = UIStoryboard(name: "PlantRegistrationManual", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ManualNewPlant") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Search for the inserted text in searchBar and reload tableview data showing the results
    func filterContentForSearchText(_ searchText: String) {
        plants = plantRepository.readAllItems()
        filteredPlants = plants.filter { plant -> Bool in
            return (plant.popularName?.lowercased().contains(searchText.lowercased()))!
        }
        
        tableView.reloadData()
    }
    
    //MARK: - When user selects a row he will be redirected to another screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        plants = plantRepository.readAllItems()
        let selectedPlant = plants[indexPath.row]
        let storyboard = UIStoryboard(name: "Info", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Info") as? InfoViewController
        vc?.commonNameUserInit = selectedPlant.popularName ?? ""
        vc?.plantImageInit = selectedPlant.photo ?? ""
        vc?.generalCommentUserInit = selectedPlant.generalComments ?? ""
        vc?.habitatCommentUserInit = selectedPlant.habitatComments ?? ""
        vc?.scientificNameUserInit = selectedPlant.scientificName ?? ""
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}


extension Initial: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

private extension Initial{
    private func navBarApearence(){
        navigationItem.hidesBackButton = true 
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.937254902, blue: 0.6784313725, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 1)
    }
    
    private func setSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar planta"
        searchController.searchBar.tintColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 1)
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 1)
        navigationItem.searchController = searchController
        navigationController?.navigationItem.hidesSearchBarWhenScrolling = true
        UITextField.appearance().backgroundColor = #colorLiteral(red: 0.5411764706, green: 0.1490196078, blue: 0.01960784314, alpha: 0.1193011558)
    }
}
