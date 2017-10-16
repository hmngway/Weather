//
// CurrentWeather.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
    
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
    var cityName: String {
        get {
            return _cityName
        } set {
            _cityName = newValue
        }
    }
    
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Int {
        get {
            return _currentTemp
        } set {
            _currentTemp = newValue
        }
    }
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather {
        
        let currentWeather = CurrentWeather()
        
        // Create the JSON object
        let swiftyJson = JSON(data: APIData)
        
        // Retrieve the city name
        currentWeather.cityName = swiftyJson["name"].stringValue.capitalized
        
        // Retrieve the weather type
        currentWeather.weatherType = swiftyJson["weather"][0]["main"].stringValue.capitalized
        
        // Retrieve the current temperature
        currentWeather.currentTemp = swiftyJson["main"]["temp"].intValue
        
        // Format the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        // Set the date
        let currentDate = dateFormatter.string(from: Date())
        currentWeather.date = "Today, \(currentDate)"
        
        return currentWeather
    }
    
}
