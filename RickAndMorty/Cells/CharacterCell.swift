//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit
import AlamofireImage

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImage: UIImageView!
    
    
    func configure (with character : Character){
        characterName.text = character.name
        if let imageUrlString = character.image, let imageUrl = URL(string: imageUrlString) {
            
            characterImage.af.setImage(withURL: imageUrl)
        }    }
    
}
