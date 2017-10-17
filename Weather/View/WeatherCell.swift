//
//  WeatherCell.swift
//  Weather
//
//  Created on 10/16/17.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {
    
    // Outlets
    @IBOutlet weak var weatherCellImage: NSImageView!
    @IBOutlet weak var cellDate: NSTextField!
    @IBOutlet weak var highTemp: NSTextField!
    @IBOutlet weak var lowTemp: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        
        // Set the background color and corner radius of each cell
        self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
        self.view.layer?.cornerRadius = 5
    }
    
    func configureCell(weatherCell: Forecast) {
        weatherCellImage.image = NSImage(named: NSImage.Name(rawValue: weatherCell.weatherType))
        highTemp.stringValue = "\(weatherCell.highTemp)°"
        lowTemp.stringValue = "\(weatherCell.lowTemp)°"
        cellDate.stringValue = weatherCell.date
    }
    
}
