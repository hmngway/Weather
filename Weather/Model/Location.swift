//
// Location.swift
// Weather
//
// Created on 10/17/17.
//

import Foundation

class Location {
    
    // Variables
    static var instance = Location()
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    
    // Getters & setters
    var latitude: Double {
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double {
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
    
}
