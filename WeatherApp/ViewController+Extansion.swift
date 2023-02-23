//
//  ViewController+Extansion.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation
import UIKit

extension ViewController {
    
    @objc func addButtonDidTap(){
        let alert = UIAlertController(title: "Add city", message: "Use english city names only", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "City name"
        }
        
        let addDidTap = UIAlertAction(title: "Add", style: .default) { _ in
            guard let city = alert.textFields?.first?.text?.capitalized else { return }
            let userDefaults = UserDefaults.standard
            userDefaults.set(city, forKey: "model")
            self.loadInfo()
        }
        let cancelDidTap = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(addDidTap)
        alert.addAction(cancelDidTap)
        present(alert, animated: true)
    }
    
    @objc func forecastButtonDidTap(){
        
    }
    
    @objc func refreshButtonDidTap(){
        let userDefaults = UserDefaults.standard
        guard let city = userDefaults.string(forKey: "model") else { return }
        networkService.loadWeather(city: city) { model in
            self.weatherModel = model
        }
        
    }
    
    func loadInfo() {
        let userDefaults = UserDefaults.standard
        if let city = userDefaults.string(forKey: "model") {
            networkService.loadWeather(city: city) { [self] model in
                weatherModel = model
                guard let currentLoc = weatherModel?.city,
                      let country = weatherModel?.system.country,
                      let currTemperature = weatherModel?.main.temperature,
                      let tempDiscription = weatherModel?.main.feelsLike,
                      let tempMax = weatherModel?.main.temperatureMax,
                      let tempMin = weatherModel?.main.temperatureMin
                else { return }
                currentLocation.text = "\(currentLoc), \(country)"
                currentTemperatureLabel.text = "\(currTemperature)°C"
                temperatureDescription.text = "Feels like: \(tempDiscription)°C"
                temperatureMax.text = "MAX: \(tempMax)°C"
                temperatureMin.text = "MIN: \(tempMin)°C"
                temperatureImage.isHidden = false
            }
        } else {
            return
        }
    }
}
