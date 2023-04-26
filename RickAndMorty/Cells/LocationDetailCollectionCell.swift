//
//  LocationDetailCollectionCell.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit
import AlamofireImage

class LocationDetailCollectionCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func setupUI(_ url: String){
        let index = url.split(separator: "/")
        let urlString: String = "https://rickandmortyapi.com/api/character/avatar/" + index[4] + ".jpeg"
        let urlString2 : URL = URL(string: urlString)!
        self.imageView.af.setImage(withURL: urlString2)
    }
}
