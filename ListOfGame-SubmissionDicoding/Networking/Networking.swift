//
//  Networking.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 10/09/21.
//

import Foundation
import UIKit

class Networking{
    
    func getDataGameFromAPI(completion : @escaping(Result<DataGame, Error>) -> Void){

        let apiKey = "e8f28660085f4dea92e563de087af121"
//        let page = "1"
//        let language = "en-US"
        
        var components = URLComponents(string: "https://api.rawg.io/api/games")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
//            URLQueryItem(name: "page", value: page),
//            URLQueryItem(name: "language", value: language)
        ]
        
        let request = URLRequest(url: components.url!)
        
        print(components.url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                print("Response is Empty or Response not detect. Try it again!")
                return
            }
            print("HTTP Status : \(response)")
            
            guard let data = data else{
                print("There is no data, hikssss :((")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonDataGame = try decoder.decode(DataGame.self, from: data)
                
                DispatchQueue.main.async {
                    
                    completion(.success(jsonDataGame))
                    print(jsonDataGame)
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getDetailGame(id: Int, completion : @escaping(Result<GameDetail, Error>) -> Void) {
        let apiKey = "e8f28660085f4dea92e563de087af121"
//        let page = "1"
//        let language = "en-US"
        
        var components = URLComponents(string: "https://api.rawg.io/api/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
//            URLQueryItem(name: "page", value: page),
//            URLQueryItem(name: "language", value: language)
        ]
        
        let request = URLRequest(url: components.url!)
        
        print(components.url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                print("Response is Empty or Response not detect. Try it again!")
                return
            }
            print("HTTP Status : \(response)")
            
            guard let data = data else{
                print("There is no data, hikssss :((")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonDataGame = try decoder.decode(GameDetail.self, from: data)
                
                DispatchQueue.main.async {
                    
                    completion(.success(jsonDataGame))
                    print(jsonDataGame)
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
