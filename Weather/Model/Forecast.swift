//
// Forecast.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation
import SwiftyJSON

class Forecast {
    
    // Variables
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _highTemp: Int!
    fileprivate var _lowTemp: Int!
    
    // Getters & setters
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
    
    var highTemp: Int {
        get {
            return _highTemp
        } set {
            _highTemp = newValue
        }
    }
    
    var lowTemp: Int {
        get {
            return _lowTemp
        } set {
            _lowTemp = newValue
        }
    }
    
    // Functions
    class func loadForecastFromData(_ APIData: Data) -> [Forecast] {
        
        var forecast = [Forecast]()
        
        // Create the JSON object
        let json = JSON(data: APIData)
        
        if let list = json["list"].array {
            for day in list {
                let dayForecast = Forecast()
                
                // Retrieve the high temperature
                dayForecast.highTemp = day["temp"]["max"].intValue
                
                // Retrieve the low temperature
                dayForecast.lowTemp = day["temp"]["min"].intValue
                
                // Retrieve the weather type
                dayForecast.weatherType = day["weather"][0]["main"].stringValue
                
                // Retrieve the date
                let date = day["dt"].doubleValue
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                dayForecast.date = unixConvertedDate.dayOfTheWeek()
                
                // Append the day forecast to the array
                forecast.append(dayForecast)
            }
        }
        
        return forecast
    }
    
}
