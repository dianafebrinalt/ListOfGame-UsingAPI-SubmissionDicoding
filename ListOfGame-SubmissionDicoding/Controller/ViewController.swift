//
//  ViewController.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 09/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var menuGameCollectionView: UICollectionView!
    
    private var viewModelGame = GameViewModel()
    var games : [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        profileBtn.layer.masksToBounds = true
        profileBtn.layer.cornerRadius = profileBtn.frame.width/2
        profileBtn.setImage(UIImage(named: "me"), for: .normal)
        
        menuGameCollectionView.dataSource = self
        menuGameCollectionView.delegate = self
        loadPopularMoviesData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuGameCollectionView.reloadData()
    }
    
    private func loadPopularMoviesData() {
        viewModelGame.fetchDataGameFromApi { [weak self] result in
            
            switch result {
                case .success(let data):
                    self?.games = data.games
                    self?.menuGameCollectionView.reloadData()
                case .failure(let error):
                    print("Error while fetch data game from api")
            }
        }
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileDianaController") as! ProfileController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellGame", for: indexPath) as! GameCollectionCell
        
        let game = games[indexPath.item]
        cell.game = game
        cell.delegate = self
        
        return cell
    }
}

extension ViewController : GameCollectionCellDelegate{
    func actionButtonDetail(id: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailGameController") as! DetailGameController
        vc.id = id
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

