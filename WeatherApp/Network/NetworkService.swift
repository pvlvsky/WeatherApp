//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    func loadWeather(city: String, completion: @escaping (WeatherModel) -> ()) {
        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [URLQueryItem(name: "q", value: formattedCity),
                                    URLQueryItem(name: "units", value: "metric"),
                                    URLQueryItem(name: "appid", value: "f7ed119215357f81117dee5db6aa59ae")]
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = data {
                let weather = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)
                DispatchQueue.main.async {
                    guard let weather = weather else { return }
                    completion(weather)
                }
            }
        }.resume()
    }
    
    func loadLocation(lat: String, lon: String, completion: @escaping (WeatherModel) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        urlComponents.queryItems = [URLQueryItem(name: "lat", value: lat ),
                                    URLQueryItem(name: "lon", value: lon),
                                    URLQueryItem(name: "appid", value: "f7ed119215357f81117dee5db6aa59ae")]
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = data {
                let weather = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)
                DispatchQueue.main.async {
                    guard let weather = weather else { return }
                    completion(weather)
                }
            }
        }.resume()
    }
    
//    func loadForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ()) {
//    }
    
}