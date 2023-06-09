//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    var characterViewModel = CharacterViewModel()
    
    var dataList: [Character] = []
    var filteredList : [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getData()
    }
    
    func getData(){
        characterViewModel.fetchCharacters { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.collectionView.reloadData()
            }
        }    }
    func setup(){
        title = "Characters"
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }
    
}
// MARK: - Collection View
extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !filteredList.isEmpty{
            return filteredList.count
        }else{
            return characterViewModel.characters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.characterCellIdentifier, for: indexPath) as! CharacterCell
        
        if filteredList.isEmpty  {
            let data = characterViewModel.characters[indexPath.row]
            cell.configure(with: data)
        }else {
            let fData = filteredList[indexPath.row]
            cell.configure(with: fData)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width/2.5
        let height = self.view.frame.width/3
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if filteredList.isEmpty{
            
            
            let character = characterViewModel.getCharacter(at: indexPath.row)
            performSegue(withIdentifier: Constants.toDetailsegue, sender: character)
        }else{
            let fData = filteredList[indexPath.row]
            performSegue(withIdentifier: Constants.toDetailsegue, sender: fData)
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CharacterDetailVC
        let vm = CharacterDetailViewModel(sender as! Character)
        vc.characterDetailViewModel = vm
    }
}

// MARK: -Search
extension CharacterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataList = characterViewModel.characters
        filteredList = dataList.filter{
            $0.name.range(of: searchText, options: [.caseInsensitive, .diacriticInsensitive]) != nil }
        collectionView.reloadData()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        collectionView.reloadData()
    }
    
}
