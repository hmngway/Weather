//
//  AppDelegate.swift
//  Weather
//
//  Created on 10/15/17.
//

import Cocoa
import CoreLocation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, CLLocationManagerDelegate {

    // Variables
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Set the delegate
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.distanceFilter = 1000
        locationManager.startUpdatingLocation()
        
        statusItem.button?.title = "--°"
        
        // Allow the status item to perform an action
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        
        // Set the timer for updating data
        let updateWeatherData = Timer.scheduledTimer(timeInterval: 60 * 15, target: self, selector: #selector(AppDelegate.downloadWeatherData), userInfo: nil, repeats: true)
        updateWeatherData.tolerance = 60
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[locations.count - 1]
        Location.instance.latitude = currentLocation.coordinate.latitude
        Location.instance.longitude = currentLocation.coordinate.longitude
        
        downloadWeatherData()
    }
    
    @objc func downloadWeatherData() {
        WeatherService.instance.downloadWeatherDetails {
            self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
            
            WeatherService.instance.downloadForecast(completed: {
                NotificationCenter.default.post(name: NOTIF_DOWNLOAD_COMPLETE, object: nil)
                self.locationManager.stopUpdatingLocation()
            })
        }
    }
    
    // Called when the status item button is clicked
    @objc func displayPopUp(_ sender: AnyObject) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        
        guard let vc = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "WeatherVC")) as? NSViewController else { return }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .minY)
    }

}

