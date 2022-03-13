//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 12.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userInfoLabel: UILabel!

    var userInfo: String!
    var image: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoLabel.text = userInfo ?? "nothing"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fotoVC = segue.destination as? FotoViewController else { return }
        fotoVC.foto = image ?? ""
    }

}
