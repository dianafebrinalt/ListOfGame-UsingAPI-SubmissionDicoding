//
//  GameViewModel.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 11/09/21.
//

import Foundation

class GameViewModel {
    
    var network = Networking()
    
    func fetchDataGameFromApi(completion : @escaping(Result<DataGame, Error>) -> Void){
        
        network.getDataGameFromAPI(completion: completion)
    }
}
