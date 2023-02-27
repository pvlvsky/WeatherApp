//
//  TodayWeatherVC+Extansion.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation
import UIKit

extension TodayWeatherVC {
    
    @objc func addButtonDidTap(){
        let alert = UIAlertController(title: "Add city", message: "Use english city names only", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "City name"
        }
        
        let addDidTap = UIAlertAction(title: "Add", style: .default) { _ in
            guard let city = alert.textFields?.first?.text?.capitalized else { return }
            self.weatherModel.startFetch(city)
            self.updateView()
        }
        let cancelDidTap = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(addDidTap)
        alert.addAction(cancelDidTap)
        present(alert, animated: true)
    }
        
        func dateFormatter(_ date: Double) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy hh:mm"
            let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
            return stringDate
        }
        
        //    @objc func forecastButtonDidTap(){
        //
        //    }
        
        //    @objc func refreshButtonDidTap(){
        //        let userDefaults = UserDefaults.standard
        //        guard let city = userDefaults.string(forKey: "model") else { return }
        //        networkService.loadWeather(city: city) { model in
        //            self.weatherModel = model
        //        }
        //    }
    }
