//
//  WeatherViewController.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/15/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import UIKit
import KVLoading
import SwiftyJSON
import Message

class WeatherViewController: UIViewController {
    
    // MARK - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    
    unowned var weatherPresenter = WeatherPresenter()
    
    // MARK - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextView.isScrollEnabled = false
        infoTextView.textContainerInset = UIEdgeInsetsMake(5, 6, 5, 5);
        weatherPresenter.attachView(view: self)
        weatherPresenter.getWeather()
    }
    
}

extension WeatherViewController: WeatherView {
    
    func startLoading() {
        KVLoading.show()
    }
    
    func finishLoading() {
        KVLoading.hide()
    }
    
    func showWeatherData(_ response: JSON) {
        let temp = response["main"]["temp"].stringValue
        let pressure = response["main"]["pressure"].stringValue
        let humidity = response["main"]["humidity"].stringValue
        var text = ""
        text += "Temperature: \(temp)"
        text += "\n"
        text += "Pressure: \(pressure)"
        text += "\n"
        text += "Humidity: \(humidity)"
        self.infoTextView.text = text
    }
    
    func showError(_ message: String) {
        Alert(withMessage: message).addButton(withTitle: "OK").show()
    }
    
}
