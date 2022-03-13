//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 12.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var userInfoLabel: UILabel!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = user.person.fullname
        userInfoLabel.text = user.person.personalInfo
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fotoVC = segue.destination as? FotoViewController else { return }
        fotoVC.user = user
    }

}
