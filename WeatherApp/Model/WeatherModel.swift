//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

struct WeatherModel: Codable {
    var coordinates: Coordinates
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var system: System
    var timezone: Int
    var id: Int
    var name: String
    var code: Int
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case system = "sys"
        case timezone
        case id
        case name
        case code = "cod"
    }
}

struct Coordinates: Codable {
    var lon: Float
    var lat: Float
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temperature: Float
    var feelsLike: Float
    var temperatureMin: Float
    var temperatureMax: Float
    var pressure: Int
    var humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
        case pressure
        case humidity
    }
}

struct Wind: Codable {
    var speed: Float
    var deg: Int
    var gust: Float
}

struct Clouds: Codable {
    var all: Float
}

struct System: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
