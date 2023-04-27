//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

class LocationViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    var locationViewModel = LocationViewModel()
    var dataList : [Location] = []
    var filteredList : [Location] = []
    
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Locations"
        setupUI()
        setUpVM()
        
    }
    
    private func setUpVM(){
        locationViewModel.fetchCharacters { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    private func setupUI() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.detailCellIdentifier)
    }
    
    
    // MARK: - Search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataList = locationViewModel.locations
        filteredList = dataList.filter {$0.name.lowercased().contains(searchText.lowercased())}
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        tableView.reloadData()
    }
    
    //MARK: -Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !filteredList.isEmpty{
            return filteredList.count
        }else{
            return locationViewModel.locations.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.detailCellIdentifier, for: indexPath)
        
        if filteredList.isEmpty {
            let data = locationViewModel.locations[indexPath.row]
            cell.textLabel?.text = data.name
        }else{
            let fData = filteredList[indexPath.row]
            cell.textLabel?.text = fData.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if filteredList.isEmpty{
            let location = locationViewModel.locations[indexPath.row]
            performSegue(withIdentifier: Constants.toLocationDetailsegue, sender: location)
        }else{
            let fData = filteredList[indexPath.row]
            performSegue(withIdentifier: Constants.toLocationDetailsegue, sender: fData)
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LocationDetailViewController
        let vm = LocatiomDetailVM(sender as! Location)
        vc.viewModel = vm
    }
}
