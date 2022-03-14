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

    private let user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradient(
            from: .lightGray,
            to: .white,
            start: CGPoint(x: 0, y: 0),
            end: CGPoint(x: 0, y: 1)
        )
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginButtonPressed() {
        guard userNameTextField.text == user.name, passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "welcomeVCSegue", sender: nil)
    }

    @IBAction func forgotUserNamePasswordButtonsPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.name)")
        : showAlert(title: "Oops!", message: "Your password is \(user.password)")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
    // MARK: Extensions
extension LoginViewController {

    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
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
