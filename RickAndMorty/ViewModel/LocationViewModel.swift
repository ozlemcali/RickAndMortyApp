//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import Foundation
import Alamofire

class LocationViewModel {
    var locations = [Location]()
        var numberOfCharacters: Int {
        return locations.count
    }
    
    func getCharacter(at index: Int) -> Location {
        return locations[index]
    }
    
    func fetchCharacters(completion: @escaping (Error?) -> Void) {
        let url = Constants.baseUrl + Constants.locationsEndpoint
        AF.request(url).responseDecodable(of: LocationDataModel.self) { response in
            switch response.result {
            case .success(let locationList):
                self.locations = locationList.results
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
        
    }
}
