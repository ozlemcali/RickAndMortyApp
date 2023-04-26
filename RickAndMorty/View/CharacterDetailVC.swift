//
//  CharacterDetailVC.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit
import AlamofireImage

class CharacterDetailVC: UIViewController {
    var characterDetailViewModel : CharacterDetailViewModel!
    var episodes =  [String] ()
    
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var createdLabel: UILabel!
    @IBOutlet var episodesLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      
    }
    
    func setupUI(){
        self.characterName.text = characterDetailViewModel.results.name
        self.statusLabel.text = characterDetailViewModel.results.status
        self.speciesLabel.text = characterDetailViewModel.results.species
        self.genderLabel.text = characterDetailViewModel.results.gender
        self.originLabel.text = characterDetailViewModel.results.origin.name
        self.locationLabel.text = characterDetailViewModel.results.location.name
        self.createdLabel.text = characterDetailViewModel.results.created
        characterImage.set(characterDetailViewModel.results.image)
      
        
        if let characterEpisodes = characterDetailViewModel.results.episode {
            episodes = characterEpisodes
        }
        
        for episode in episodes {
            let episodeNumber = episode.split(separator: "/").last
            if let episodeNumber = episodeNumber {
                episodesLabel.text?.append("\(episodeNumber) ")
            }
            
        }
    }
}
