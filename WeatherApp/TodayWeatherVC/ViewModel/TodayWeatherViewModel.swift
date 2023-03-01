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
                                                                timeText: model.list[0].date,
                                                                temperatureText: "\(model.list[0].main.temperature)°C",
                                                                temperatureDescriptionText: "Feels like: \(model.list[0].main.feelsLike)",
                                                                temperatureImage: "\(model.list[0].weather[0].icon)",
                                                                temperatureMaxText: "Min: \(model.list[0].main.temperatureMin)°C",
                                                                temperatureMinText: "Max: \(model.list[0].main.temperatureMax)°C")))
        }
    }
}
