//
//  LoginPresenter.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/15/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import UIKit

protocol LoginView: class {
    func startLoading()
    func showWeatherController()
    func showError(_ message: String)
}

class LoginPresenter: BasePresenter<UIViewController> {
    
    var loginView: LoginView? {
        return self.viewController as? LoginView
    }
    
    func loginUser(username: String?, password: String?) {
        self.loginView!.startLoading()
        UserService.shared.login(username: username!, password: password!, success: { (response) in
            self.loginView!.showWeatherController()
        }, failure: { (error) in
            self.loginView!.showError("Incorrect credentials.")
        })
    }
    
}
