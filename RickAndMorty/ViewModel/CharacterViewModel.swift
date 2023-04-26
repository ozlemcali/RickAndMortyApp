//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import Foundation
import Alamofire


class CharacterViewModel {
    var characters = [Character]()
    var numberOfCharacters: Int {
        return characters.count
    }
    
    func getCharacter(at index: Int) -> Character {
        return characters[index]
    }
    
    func fetchCharacters(completion: @escaping (Error?) -> Void) {
        let url = Constants.baseUrl + Constants.charactersEndpoint
        AF.request(url).responseDecodable(of: CharacterDataModel.self) { response in
            switch response.result {
            case .success(let characterList):
                self.characters = characterList.results
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
        
    }
    

    
}

