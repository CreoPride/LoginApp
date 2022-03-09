    //
    //  ViewController.swift
    //  LoginApp
    //
    //  Created by Konstantin Fomenkov on 08.03.2022.
    //

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private let userName = "admin"
    private let password = "123"

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        clearPassword(AndUserName: true)
    }

    @IBAction func loginButtonPressed() {
        if checkLoginPassword() {
            performSegue(withIdentifier: "welcomeVCSegue", sender: nil)
        } else {
            invalidLoginOrPasswordAlert()
            clearPassword(AndUserName: false)
        }
    }

    @IBAction func forgotUserNamePasswordButtonsPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: forgotUserName(orPassword: false)
        default: forgotUserName(orPassword: true)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            if checkLoginPassword() {
                passwordTextField.resignFirstResponder()
                performSegue(withIdentifier: "welcomeVCSegue", sender: nil)
                return true
            } else {
                invalidLoginOrPasswordAlert()
                clearPassword(AndUserName: false)
            }
        }
        return false
    }

    private func checkLoginPassword() -> Bool {
        if userNameTextField.text == userName,
           passwordTextField.text == password {
            return true
        } else {
            return false
        }
    }

    private func clearPassword(AndUserName name: Bool) {
        if name {
            userNameTextField.text?.removeAll()
        }
        passwordTextField.text?.removeAll()
    }
}
    //MARK: ALERT MESSAGES
extension LoginViewController {

    private func invalidLoginOrPasswordAlert() {
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
        let message = password ? "Your password is \(self.password)" : "Your name is \(userName)"
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
