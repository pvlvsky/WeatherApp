//
//  TodayWetherView.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 27.02.23.
//

import UIKit

class TodayWetherView: UIView {
    var todayWeatherData: TodayWeatherData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    
    lazy var currentLocationLabel = makeCurrentLocationLabel()
    lazy var currentTimeLabel = makeCurrentTimeLabel()
    lazy var currentTemperatureLabel = makeCurrentTemperatureLabel()
    lazy var weatherImage = makeWeatherImage()
    lazy var temperatureMinLabel = makeTemperatureMinLabel()
    lazy var temperatureMaxLabel = makeTemperatureMaxLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch todayWeatherData {
        case .initial:
            update(viewData: nil, isHidden: false)
        case .loading(let loading):
            update(viewData: loading, isHidden: true)
        case .succses(let succses):
            
            update(viewData: succses, isHidden: false)
            
            loadImage(url: "") { image in
                self.weatherImage.image = image
            }
//            weatherImage.loadImage(url: succses.temperatureImage) { [weak self] image in
//                self?.weatherImage.image = image
//            }
        case .failure(let failure):
            update(viewData: failure, isHidden: true)
        }
    }
    
    func loadImage(url: String?, completion: @escaping (UIImage) -> ()) {
        guard let url = url else { return }
        let urlRequest: URL = URL(string: "http://api.openweathermap.org/img/wn/04d@2x.png")!
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/img/wn/\(url)@2x.png"
        guard let url = urlComponents.url else { return }
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if data != nil {
                let imageData = try? Data(contentsOf: urlRequest)
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    completion(image)
                }
            }
        }.resume()
    }
    
    func update(viewData: TodayWeatherData.ViewData?, isHidden: Bool) {
        print(viewData as Any)
        guard let viewData = viewData else { return }
        currentLocationLabel.text = viewData.locationText
        currentLocationLabel.isHidden = isHidden
        currentTimeLabel.text = viewData.timeText
        currentTimeLabel.isHidden = isHidden
        currentTemperatureLabel.text = viewData.temperatureText
        currentTemperatureLabel.isHidden = isHidden
        temperatureMinLabel.text = viewData.temperatureMinText
        temperatureMinLabel.isHidden = isHidden
        temperatureMaxLabel.text = viewData.temperatureMaxText
        temperatureMaxLabel.isHidden = isHidden
        weatherImage.isHidden = isHidden
    }
    
}

