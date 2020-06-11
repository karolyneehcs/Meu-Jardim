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
    
    // MARK: - Table view data source
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredFruits: [String] = []
    let cellIdentifier = "CellIdentifier"
    var fruits = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    //define the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // blocks delete action if the user is searching
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if isFiltering {
            return UITableViewCell.EditingStyle.none
        } else {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    // swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            fruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }
    
    // return the number of filtered results to fill the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFruits.count
        }
        
        return fruits.count
    }
    
    // shows the full table view or the search results if user is searching
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InitialCell
        
        var fruit : String
        if isFiltering {
            fruit = filteredFruits[indexPath.row]
        } else {
            fruit = fruits[indexPath.row]
        }
        
        cell.plantImage.image = UIImage(named: "lettucee")
        cell.plantName.text = fruit
        return cell
    }
    
    // when user taps the plus button he will be redirect to another screen
    @objc func addTapped(_sender: UINavigationItem){
        //        let storyboard = UIStoryboard(name: "next", bundle: nil)
        //         let vc = storyboard.instantiateViewController(withIdentifier: "nextCont") as UIViewController
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // search for the inserted text in the textfield of searchBar and reload tableview data showing the results
    func filterContentForSearchText(_ searchText: String) {
        filteredFruits = fruits.filter { fruit -> Bool in
            return fruit.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    // when user selects a row he will be redirected to another screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let storyboard = UIStoryboard(name: "next", bundle: nil)
        //         let vc = storyboard.instantiateViewController(withIdentifier: "nextCont") as UIViewController
        //        self.navigationController?.pushViewController(vc, animated: true)
        print("go to information screen")
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
