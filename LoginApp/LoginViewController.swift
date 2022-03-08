//
//  ViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
            clearPassword(AndUserName: true)
    }

    private func clearPassword(AndUserName name: Bool) {
        if name { userNameTextField.text?.removeAll() }
        passwordTextField.text?.removeAll()
    }

}
