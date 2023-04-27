//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var dimensionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var viewModel : LocatiomDetailVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.nameLabel.text = viewModel.results.name
        self.typeLabel.text = viewModel.results.type
        self.dimensionLabel.text = viewModel.results.dimension
        
    }
}

// MARK: - Collection View with Cell
extension LocationDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.results.residents!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.detailCellIdentifier, for: indexPath) as! LocationDetailCollectionCell
        let data = viewModel.results
        cell.setupUI(data.residents![indexPath.row])
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.width / 3
        let height = self.view.frame.height / 6
        
        return CGSize(width: width, height: height)
    }
    
    
    
    
}
