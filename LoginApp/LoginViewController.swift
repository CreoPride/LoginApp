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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard userNameTextField.text == "Admin", passwordTextField.text == "123" else { return }
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }

    @IBAction func loginButtonPressed() {
        guard userNameTextField.text == "Admin", passwordTextField.text == "123" else {
            invalidLoginOrMessageAlert()
            clearPassword(AndUserName: false)
            return
        }
    }

    @IBAction func forgotUserNamePasswordPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: forgotUserName(orPassword: false)
        default: forgotUserName(orPassword: true)
        }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        clearPassword(AndUserName: true)
    }

    private func clearPassword(AndUserName name: Bool) {
        if name { userNameTextField.text?.removeAll() }
        passwordTextField.text?.removeAll()
    }

}
    //MARK: ALERT MESSAGES
extension LoginViewController {

    private func invalidLoginOrMessageAlert() {
        let alert = UIAlertController(
            title: "Invalid login or password",
            message: "Please, enter correct login and password",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }

    private func forgotUserName(orPassword password: Bool) {
        let message = password ? "Your password is 123" : "Your name is Admin"
        let alert = UIAlertController(
            title: "Oops!",
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }

}
