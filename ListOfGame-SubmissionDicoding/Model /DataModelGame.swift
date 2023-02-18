//
//  DataModelGame.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 10/09/21.
//

import Foundation
import UIKit

class DataGame : Decodable{
    
    let games : [Game]
    
    private enum CodingKeys : String, CodingKey{
        case games = "results"
    }
}

class Game: Decodable {
    let id : Int?
    let name : String?
    let released : String?
    let backgroundImage : String?
    let rating : Double?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
    }
}

class GameDetail: Decodable{
    let id : Int?
    let name : String?
    let description : String?
    let released : String?
    let backgroundImage : String?
    let rating : Double?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case description
    }
}
