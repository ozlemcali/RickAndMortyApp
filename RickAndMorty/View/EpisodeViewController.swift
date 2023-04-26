//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

class EpisodeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    let episodeViewModel = EpisodeViewModel()
    var dataList: [Episode] = []
    var filteredList: [Episode] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        episodeViewModel.fetchEpisodes { error in
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataList = episodeViewModel.episodes
        filteredList = dataList.filter {$0.name.lowercased().contains(searchText.lowercased())}
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !filteredList.isEmpty{
            return filteredList.count
        }else{
            return episodeViewModel.episodes.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if filteredList.isEmpty {
            let data = episodeViewModel.episodes[indexPath.row]
            cell.textLabel?.text = data.name
            
        }else{
            let fData = filteredList[indexPath.row]
            cell.textLabel?.text = fData.name
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if filteredList.isEmpty{
            let episodes = episodeViewModel.episodes[indexPath.row]
            performSegue(withIdentifier: "toEpisodeDetailVC", sender: episodes)
        }else{
         let fData = filteredList[indexPath.row]
           performSegue(withIdentifier: "toEpisodeDetailVC", sender: fData)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EpisodeDetailVC
        let vm = EpisodeDetailVM(sender as! Episode)
        vc.viewModel = vm
    }
   
}
