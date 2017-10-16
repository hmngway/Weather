//
//  AppDelegate.swift
//  Weather
//
//  Created on 10/15/17.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // Variables
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "--°"
        
        // Allow the status item to perform an action
        statusItem.action = #selector(AppDelegate.displayPopUp(_:))
        
        WeatherService.instance.downloadWeatherDetails {
            self.statusItem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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

