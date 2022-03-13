//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullname)!"
        makeGradient(
            from: .green,
            to: .lightGray,
            start: CGPoint(x: 0, y: 0),
            end: CGPoint(x: 1, y: 1)
        )
    }
}

