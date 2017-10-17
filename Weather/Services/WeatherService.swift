//
// WeatherService.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation
import Alamofire

class WeatherService {
    
    // Variables
    static let instance = WeatherService()
    fileprivate var _currentWeather = CurrentWeather()
    fileprivate var _forecast = [Forecast]()
    
    // Getters & setters
    var currentWeather: CurrentWeather {
        get {
            return _currentWeather
        } set {
            _currentWeather = newValue
        }
    }
    
    var forecast: [Forecast] {
        get {
            return _forecast
        } set {
            _forecast = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        
        Alamofire.request(url!).responseData { (response) in
            
            self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
            completed()
        }
    }
    
    // Functions
    func downloadForecast(completed: @escaping DownloadComplete) {
        let url = URL(string: API_URL_FORECAST)
        
        Alamofire.request(url!).responseData { (response) in
            
            self.forecast = Forecast.loadForecastFromData(response.data!)
            
            // Remove the first array object (the current day)
            if self.forecast.count > 0 {
                self.forecast.remove(at: 0)
            }
            
            completed()
        }
    }
    
}
