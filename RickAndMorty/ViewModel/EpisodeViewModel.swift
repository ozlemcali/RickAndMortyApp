//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import Foundation
import Alamofire

class EpisodeViewModel{
    var episodes = [Episode] ()
    
    var numberOfCharacters : Int {
        return episodes.count
    }
    
    func getEpisode(at index: Int) ->Episode{
        return episodes[index]
    }
   
    func fetchEpisodes(completion: @escaping (Error?)->Void){
        let url = Constants.baseUrl + Constants.episodesEndpoint
        
        AF.request(url).responseDecodable (of: EpisodeDataModel.self) { response in
            switch response.result {
            case .success(let episodesList):
                self.episodes = episodesList.results
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
        
    }
    
}
