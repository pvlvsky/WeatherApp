//
//  TodayWetherView + Extention.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 27.02.23.
//

import UIKit

extension TodayWetherView {
    func makeCurrentLocationLabel() -> UILabel {
        let currentLocationlabel = makeLabel(size: 30, withFont: .heavy)
        addSubview(currentLocationlabel)
        NSLayoutConstraint.activate([currentLocationlabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                                     currentLocationlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     currentLocationlabel.heightAnchor.constraint(equalToConstant: 70),
                                     currentLocationlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
                                    ])
        return currentLocationlabel
    }
    
    func makeCurrentTimeLabel() -> UILabel {
        let currentTimelabel = makeLabel(size: 10, withFont: .heavy)
        
            addSubview(currentTimelabel)
            
            
        currentTimelabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([currentTimelabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 8),
                                         currentTimelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                         currentTimelabel.heightAnchor.constraint(equalToConstant: 10),
                                         currentTimelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
                                        ])
        return currentTimelabel
    }
    
    func makeCurrentTemperatureLabel() -> UILabel {
        let currentTemperatureLabel = makeLabel(size: 60, withFont: .heavy)
        addSubview(currentTemperatureLabel)
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([currentTemperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
                                     currentTemperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 70),
                                     currentTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
                                    ])
        return currentTemperatureLabel
    }
    
    func makeWeatherImage() -> CustomImageView {
        let weatherImage = CustomImageView()
        addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.contentMode = .scaleAspectFit
        weatherImage.tintColor = .gray
        NSLayoutConstraint.activate([weatherImage.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor),
                                     weatherImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     weatherImage.heightAnchor.constraint(equalToConstant: 50),
                                     weatherImage.widthAnchor.constraint(equalToConstant: 50)
                                    ])
        return weatherImage
        
    }
    
    func makeTemperatureDescriptionLabel() -> UILabel {
        let temperatureDescriptionLabel = makeLabel(size: 14, withFont: .light)
        addSubview(temperatureDescriptionLabel)
        temperatureDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([temperatureDescriptionLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 16),
                                     temperatureDescriptionLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 8),
                                     temperatureDescriptionLabel.heightAnchor.constraint(equalToConstant: 20),
                                     temperatureDescriptionLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
        return temperatureDescriptionLabel
    }
    
    func makeTemperatureMinLabel() -> UILabel {
        let temperatureMinLabel = makeLabel(size: 14, withFont: .medium)
        addSubview(temperatureMinLabel)
    
        temperatureMinLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ temperatureMinLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 80),
                                      temperatureMinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                      temperatureMinLabel.heightAnchor.constraint(equalToConstant: 20),
                                      temperatureMinLabel.widthAnchor.constraint(equalToConstant: 100)
                                    ])
        return temperatureMinLabel
    }
    
    func makeTemperatureMaxLabel() -> UILabel {
        let temperatureMaxLabel = makeLabel(size: 14, withFont: .medium)
        addSubview(temperatureMaxLabel)
    
        NSLayoutConstraint.activate([temperatureMaxLabel.topAnchor.constraint(equalTo: temperatureMinLabel.bottomAnchor),
                                     temperatureMaxLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     temperatureMaxLabel.heightAnchor.constraint(equalToConstant: 20),
                                     temperatureMaxLabel.widthAnchor.constraint(equalToConstant: 100)
                                    ])
        return temperatureMaxLabel
    }
    
    func makeLabel(size: CGFloat, withFont: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .natural
        label.font = UIFont.systemFont(ofSize: size, weight: withFont)
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
}

