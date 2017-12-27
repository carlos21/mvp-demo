//
//  WeatherPresenter.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/17/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol WeatherView: class {
    
    func finishLoading()
    func showWeatherData(_ response: JSON)
    func showError(_ message: String)
}

class WeatherPresenter: BasePresenter<UIViewController> {
    
    var weatherView: WeatherView? {
        return self.viewController as? WeatherView
    }
    
    func getWeather() {
        WeatherService.shared.getWeather(fromCity: "London", success: { (response) in
            self.weatherView!.finishLoading()
            self.weatherView!.showWeatherData(response)
        }, failure: { (error) in
            self.weatherView!.finishLoading()
            self.weatherView!.showError("Server problem!")
        })
    }
    
}
