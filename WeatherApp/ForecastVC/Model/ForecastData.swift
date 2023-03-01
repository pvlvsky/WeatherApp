//
//  ForecastData.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 1.03.23.
//

import Foundation

enum ForecastData {
    case initial
    case loading([String:[ViewData]])
    case succes([String:[ViewData]])
    case failure([String:[ViewData]])
}

struct ViewData {
    let timeText: String?
    let temperatureText: String?
    let temperatureImage: String?
}

