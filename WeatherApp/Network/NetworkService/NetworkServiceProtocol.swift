//
//  NetworkServiceProtocol.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

protocol NetworkServiceProtocol {
    func loadWeather(city: String, completion: @escaping (NetworkWeatherModel) -> ())
}
