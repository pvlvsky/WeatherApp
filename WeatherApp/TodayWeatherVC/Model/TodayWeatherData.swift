//
//  TodayWeatherData.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 25.02.23.
//

import Foundation

enum TodayWeatherData {
    case initial
    case loading(ViewData)
    case succses(ViewData)
    case failure(ViewData)
    
    struct ViewData {
        let locationText: String?
        let timeText: Double?
        let temperatureText: String?
        let temperatureDescriptionText: String?
        let temperatureImage: String?
        let temperatureMaxText: String?
        let temperatureMinText: String?
    }
}
