//
// Constants.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation

typealias DownloadComplete = () -> ()

let API_HOMEPAGE = "http://openweathermap.org"
let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")

let API_KEY = "&appid=845638eb53a9496b4711e782312e61f3"
let API_UNITS = "&units=imperial"
let LONGITUDE = Location.instance.longitude
let LATITUDE = Location.instance.latitude

let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=\(LATITUDE)&lon=\(LONGITUDE)\(API_UNITS)\(API_KEY)"
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(LATITUDE)&lon=\(LONGITUDE)&cnt=8\(API_UNITS)\(API_KEY)"
