//
//  WeatherService.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/17/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    
    static let shared = WeatherService()
    
    func getWeather(fromCity city:String,
                    success:@escaping (JSON) -> (),
                    failure:@escaping (Error) -> ()) {
        
        let encoding:ParameterEncoding = URLEncoding.default
        let headers:HTTPHeaders = [:]
        let params:[String: Any] = ["q": city, "appid": "bede5978c1da1b976111b3238bcacb17"]
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather", method: .get, parameters: params, encoding:encoding, headers:headers).responseJSON{ (response) in
            switch response.result {
            case .success:
                success(JSON(response.result.value!))
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }

}
