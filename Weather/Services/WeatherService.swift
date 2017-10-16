//
// WeatherService.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation
import Alamofire

class WeatherService {
    
    static let instance = WeatherService()
    
    func downloadWeatherDetails() {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        
        Alamofire.request(url!).responseJSON { (response) in
            
            print(response.result.value ?? "")
        }
    }
    
}
