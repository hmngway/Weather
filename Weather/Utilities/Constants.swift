//
// Constants.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation

typealias DownloadComplete = () -> ()

let API_HOMEPAGE = "http://openweathermap.org"

let API_KEY = "&appid=845638eb53a9496b4711e782312e61f3"
let API_UNITS = "&units=imperial"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139\(API_UNITS)\(API_KEY)"
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=8\(API_UNITS)\(API_KEY)"
