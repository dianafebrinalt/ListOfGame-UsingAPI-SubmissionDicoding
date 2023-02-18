//
//  GameCollectionCell.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 10/09/21.
//

import UIKit

protocol GameCollectionCellDelegate {
    func actionButtonDetail(id: Int)
}

class GameCollectionCell: UICollectionViewCell {
    
    private var urlString: String = ""
    var delegate : GameCollectionCellDelegate?
    var game : Game? {
        didSet {
            guard let game = game else { return }
            setCellWithValuesOf(game)
        }
    }
    
    @IBOutlet weak var posterImageGame: UIImageView!
    @IBOutlet weak var nameOfGame: UILabel!
    @IBOutlet weak var genreOfGame: UILabel!
    @IBOutlet weak var releaseDateGame: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    
    
    func setCellWithValuesOf(_ game : Game) {
        updateUICellGame(name: game.name, released: game.released, rating: game.rating, poster: game.backgroundImage)
    }

    private func updateUICellGame(name: String?, released: String?, rating: Double?, poster: String?) {
        
        self.nameOfGame.text = name
        self.releaseDateGame.text = released
        self.genreOfGame.text = "★ \(rating!)"
        
        self.posterImageGame.layer.cornerRadius = 10
        
        guard let posterString = poster else {return}
        urlString = posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.posterImageGame.image = UIImage(named: "contohgame")
            return
        }
        print("URL IMAGE : \(posterString)")
        
        // Before we download the image we clear out the old one
        self.posterImageGame.image = nil
        
        getImageDataGame(url: posterImageURL)
    }
    @IBAction func goToDetailGame(_ sender: Any) {
        delegate?.actionButtonDetail(id: game?.id ?? 0)
    }
    
    func getImageDataGame(url: URL) {
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }

            guard let data = data else{
                print("The Data is Empty")
                return
            }

            DispatchQueue.main.async{
                if let image = UIImage(data: data) {
                    self.posterImageGame.image = image
                }
            }
        }
        task.resume()
    }
}
