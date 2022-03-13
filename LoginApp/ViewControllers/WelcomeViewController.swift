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
       // makeGradientColor() не смог победить конфликт градиента с TabBar
        welcomeLabel.text = "Welcome, \(user.person.fullname)!"
        makeGradient(from: .green, to: .lightGray, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
    }
}

extension UIViewController {
    func makeGradient(from: UIColor, to: UIColor, start: CGPoint, end: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [from.cgColor, to.cgColor]
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

