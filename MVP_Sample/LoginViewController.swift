//
//  ViewController.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/15/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import UIKit
import KVLoading
import Message

let kShowWeatherIdentifier = "showWeather"

class LoginViewController: UIViewController {
    
    // MARK - Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    unowned var loginPresenter = LoginPresenter()
    
    // MARK - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter.attachView(view: self)
        usernameTextField.text = "abc"
        passwordTextField.text = "123"
    }
    
    // MARK - Actions
    
    @IBAction func loginPressed(_ sender: Any) {
        loginPresenter.loginUser(username: usernameTextField.text, password: passwordTextField.text)
    }

}

extension LoginViewController: LoginView {
    
    func startLoading() {
        KVLoading.show()
    }
    
    func finishLoading() {
        KVLoading.hide()
    }
    
    func showWeatherController() {
        self.performSegue(withIdentifier: kShowWeatherIdentifier, sender: nil)
    }
    
    func showError(_ message: String) {
        Alert(withMessage: message).addButton(withTitle: "OK").show()
    }
    
}
