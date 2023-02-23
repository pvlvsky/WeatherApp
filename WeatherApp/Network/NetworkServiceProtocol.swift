//
//  NetworkServiceProtocol.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func loadWeather(city: String, completion: @escaping (WeatherModel) -> ())
    func loadLocation(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
    //func loadForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())
}
