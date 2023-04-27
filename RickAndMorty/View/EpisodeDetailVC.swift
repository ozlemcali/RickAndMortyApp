//
//  EpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

class EpisodeDetailVC: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var viewModel : EpisodeDetailVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.nameLabel.text = viewModel.results.name
        self.episodeLabel.text = viewModel.results.episode
        self.dateLabel.text = viewModel.results.air_date
        
    }
}


//MARK: - Collection View
extension EpisodeDetailVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.results.characters!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! LocationDetailCollectionCell
        let data = viewModel.results
        // cell.setupUI(data.characters![indexPath.row])
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width / 3
        let height = self.view.frame.height / 6
        
        return CGSize(width: width, height: height)
    }
    
}

