//
//  ForecastModel.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

struct WeatherInfo {
     let temp: Float
     let temperatureMin: Float
     let temperatureMax: Float
     let description: String
     let icon: String
     let time: String
 }

 struct ForecastTemperature {
     let weekDay: String?
     let hourForecast: [WeatherInfo]?
 }
