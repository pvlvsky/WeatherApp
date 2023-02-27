//
//  TodayWeatherViewModel.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 25.02.23.
//

import Foundation

protocol TodayWeatherViewModelProtocol {
    var updateData: ((TodayWeatherData) -> ())? { get set }
    func startFetch(_ city: String)
}

final class TodayWeatherViewModel: TodayWeatherViewModelProtocol {
    public var updateData: ((TodayWeatherData) -> ())?
    var networkService: NetworkServiceProtocol = NetworkService()
    
    init() {
        updateData?(.initial)
    }
    
    func startFetch(_ city: String) {
        networkService.loadWeather(city: city) { model in
            self.updateData?(.succses(TodayWeatherData.ViewData(locationText: "\(model.city.name), \(model.city.country)",
                                      timeText: self.dateFormatter(model.list[0].date),
                                      temperatureText: "\(model.list[0].main.temperature)°C",
                                      temperatureDescriptionText: "Feels like: \(model.list[0].main.feelsLike)",
                                      temperatureImage: "\(model.list[0].weather[0].icon)",
                                      temperatureMaxText: "Min: \(model.list[0].main.temperatureMin)°C",
                                      temperatureMinText: "Max: \(model.list[0].main.temperatureMax)°C")))
            print(model)
        }
        print("________Succses_________")
        
    }
    
    func dateFormatter(_ date: Double) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy hh:mm"
        let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
        return stringDate
    }
}
