//
//  ProfileController.swift
//  ListOfGame-SubmissionDicoding
//
//  Created by Diana Febrina Lumbantoruan on 12/09/21.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var aboutSelfProfile: UITextView!
    @IBOutlet weak var favProfile: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profileImage.image = UIImage(named: "me")
        nameProfile.text = "Diana F. Lumbantoruan"
        favProfile.text = "CODING ENTHUSIAST"
        aboutSelfProfile.text = "I am a Final Year Informatics Management Student at Medan State Polytechnic. Currently enrolled at Apple Developer Academy. I love to share what I get or learn to people around me. I love to learn new things, especially about Coding. Currently, I learn about Swift, SwiftUI and UI/UX Designer and I love it so much to learn them even my skill not pro as other people. For me it's really important to have a lot of knowledge and learn something new. Thankyou❤️"
    }

    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
