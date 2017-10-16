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
    
    fileprivate var _currentWeather = CurrentWeather()
    
    var currentWeather: CurrentWeather {
        get {
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        
        Alamofire.request(url!).responseData{ (response) in
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            completed()
        }
    }
    
}
