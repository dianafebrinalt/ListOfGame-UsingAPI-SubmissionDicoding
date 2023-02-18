//
//  DetailGameViewModel.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 13/09/21.
//

import Foundation

class DetailGameViewModel {

    var network = Networking()
    
    func fetchDataGameFromApi(id: Int, completion : @escaping(Result<GameDetail, Error>) -> Void){
        
        network.getDetailGame(id: id, completion: completion)
    }
}

