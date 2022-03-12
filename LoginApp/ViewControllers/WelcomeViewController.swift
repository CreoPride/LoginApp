//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!

    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
       // makeGradientColor()
        welcomeLabel.text = "Welcome, \(userName ?? "")"
    }

    private func makeGradientColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

