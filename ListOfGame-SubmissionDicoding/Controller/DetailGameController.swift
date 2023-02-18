//
//  DetailGameController.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 13/09/21.
//

import UIKit

class DetailGameController: UIViewController {

    var id : Int?
    private var urlString: String = ""
    var detailGameViewModel  = DetailGameViewModel()
    
    @IBOutlet weak var detailTextGame: UITextView!
    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var nameOfGame: UILabel!
    @IBOutlet weak var rateOfGame: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let id = id {
            detailGameViewModel.fetchDataGameFromApi(id: id){
                result in
                
                switch result {
                case .success(let data):
                    self.setViewDetail(detailGame: data)
                    print("Result : \(data)")
                case .failure(let error):
                    print("Error While Processing Data From JSON: \(error)")
                }
            }
        }
    }
    
    func setViewDetail(detailGame : GameDetail) {
        DispatchQueue.main.async {
            self.updateUIDataGameOnDetailGame(name: detailGame.name, rating: detailGame.rating, poster: detailGame.backgroundImage, description: detailGame.description)
        }
    }
    
    private func updateUIDataGameOnDetailGame(name: String?, rating: Double?, poster: String?, description: String?) {
        
        
        self.nameOfGame.text = name
        self.rateOfGame.text = "★ \(rating!)"
        self.detailTextGame.text = description
        
        self.imageGame.layer.cornerRadius = 10
        
        guard let posterString = poster else {return}
        urlString = posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.imageGame.image = UIImage(named: "")
            return
        }
        print("URL IMAGE : \(posterString)")
        
        // Before we download the image we clear out the old one
        self.imageGame.image = nil
        
        getImageDataGame(url: posterImageURL)
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
                    self.imageGame.image = image
                }
            }
        }
        task.resume()
    }

    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
