//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 1.03.23.
//

import Foundation
protocol ForecastViewModelProtocol {
    var updateData: ((ForecastData) -> ())? { get set }
    func startFetch(_ city: String)
}

final class ForecastViewModel: ForecastViewModelProtocol {
    public var updateData: ((ForecastData) -> ())?
    var networkService: NetworkServiceProtocol = NetworkService()
    
    init() {
        updateData?(.initial)
    }
    
    func startFetch(_ city: String) {
        networkService.loadWeather(city: city) { model in
            var daysForView: [String : [ViewData]] = [:]
            model.list.forEach { list in
                let weekDay = self.dateFormatter(list.date, format: "EEEE, dd MMM")
                let day = ViewData(timeText: self.dateFormatter(list.date, format: "hh:mm"),
                                   temperatureText: "\(list.main.temperature)ºC",
                                   temperatureImage: list.weather[0].icon)
                if daysForView.keys.contains(weekDay) {
                    daysForView[weekDay]?.append(day)
                } else {
                    daysForView[weekDay] = [day]
                }
            }
            self.updateData?(.succes(daysForView))
        }
    }
    
    func dateFormatter(_ date: Double, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
        return stringDate
    }
}


