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
            weatherImage.loadImage(url: succses.temperatureImage) { image in
                self.weatherImage.image = image
            }
        case .failure(let failure):
            update(viewData: failure, isHidden: true)
        }
    }
    
    func dateFormatter(_ date: Double) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy hh:mm"
        let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
        return stringDate
    }
    
    func update(viewData: TodayWeatherData.ViewData?, isHidden: Bool) {
        print(viewData as Any)
        guard let viewData = viewData else { return }
        currentLocationLabel.text = viewData.locationText
        currentLocationLabel.isHidden = isHidden
        currentTimeLabel.text = dateFormatter(viewData.timeText ?? 0)
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

