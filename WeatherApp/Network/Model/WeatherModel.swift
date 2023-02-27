//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

struct NetworkWeatherModel: Codable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [List]
    var city: City
}

struct List: Codable {
    var date: Double
    var main: Main
    var weather: [Weather]
    var lastUpdate: String
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
        case lastUpdate = "dt_txt"
    }
}

struct Main: Codable {
    var temperature: Float
    var feelsLike: Float
    var temperatureMin: Float
    var temperatureMax: Float
    

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct City: Codable {
    var name: String
    var country: String
    var sunrise: Int
    var sunset: Int
}
