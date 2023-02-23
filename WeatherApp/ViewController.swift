//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private var currentLocation = UILabel()
    private  var currentTime = UILabel()
    private  var currentTemperatureLabel = UILabel()
    private  var temperatureDescription = UILabel()
    private  var temperatureImage = UIImageView()
    private  var temperatureMax = UILabel()
    private  var temperatureMin = UILabel()
    
    var location: CLLocation?
    var latitude : CLLocationDegrees!
    var longitude: CLLocationDegrees!
    var locationService = CLLocationManager()
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCurrentLocation()
        setupCurrentTime()
        setupCurrentTemperatureLabel()
        setupTemperatureImage()
        setupTemperatureDescription()
        setupTemperatureMin()
        setupTemperatureMax()
        setupNavigationItems()
    }
    
    private func setupView(){
        self.view.backgroundColor = .systemBackground
    }
    
    private func setupCurrentLocation() {
        view.addSubview(currentLocation)
        
        currentLocation.text = "Location"
        currentLocation.textAlignment = .left
        currentLocation.textColor = .label
        currentLocation.numberOfLines = 0
        currentLocation.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
        
        currentLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([currentLocation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                     currentLocation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     currentLocation.heightAnchor.constraint(equalToConstant: 70),
                                     currentLocation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                                    ])
    }
    
    private func setupCurrentTime(){
        view.addSubview(currentTime)
        
        currentTime.text = "23 Feb 2023"
        currentTime.textAlignment = .left
        currentTime.textColor = .label
        currentTime.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
        
        currentTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([currentTime.topAnchor.constraint(equalTo: currentLocation.bottomAnchor, constant: 8),
                                     currentTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     currentTime.heightAnchor.constraint(equalToConstant: 10),
                                     currentTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                                    ])
    }
    
    private func setupCurrentTemperatureLabel(){
        view.addSubview(currentTemperatureLabel)
        
        currentTemperatureLabel.text = "cur°C"
        currentTemperatureLabel.textColor = .label
        currentTemperatureLabel.textAlignment = .left
        currentTemperatureLabel.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([currentTemperatureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
                                     currentTemperatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     currentTemperatureLabel.heightAnchor.constraint(equalToConstant: 70),
                                     currentTemperatureLabel.widthAnchor.constraint(equalToConstant: 250)
                                    ])
    }
    
    private func setupTemperatureDescription(){
        view.addSubview(temperatureDescription)
        
        temperatureDescription.text = "Text"
        temperatureDescription.textAlignment = .left
        temperatureDescription.textColor = .label
        temperatureDescription.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        temperatureDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([temperatureDescription.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 16),
                                     temperatureDescription.leadingAnchor.constraint(equalTo: temperatureImage.trailingAnchor, constant: 8),
                                     temperatureDescription.heightAnchor.constraint(equalToConstant: 20),
                                     temperatureDescription.widthAnchor.constraint(equalToConstant: 250)
                                    ])
    }
    
    private func setupTemperatureImage(){
        view.addSubview(temperatureImage)
        
        temperatureImage.image = UIImage(systemName: "cloud.fill")
        temperatureImage.contentMode = .scaleAspectFit
        temperatureImage.tintColor = .gray
        
        temperatureImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([temperatureImage.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor),
                                     temperatureImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     temperatureImage.heightAnchor.constraint(equalToConstant: 50),
                                     temperatureImage.widthAnchor.constraint(equalToConstant: 50)
                                    ])
    }
    
    private func setupTemperatureMax(){
        view.addSubview(temperatureMax)
        
        temperatureMax.text = " max °C"
        temperatureMax.textAlignment = .left
        temperatureMax.textColor = .label
        temperatureMax.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        temperatureMax.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([temperatureMax.topAnchor.constraint(equalTo: temperatureMin.bottomAnchor),
                                     temperatureMax.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     temperatureMax.heightAnchor.constraint(equalToConstant: 20),
                                     temperatureMax.widthAnchor.constraint(equalToConstant: 100)
                                    ])
    }
    
    private func setupTemperatureMin(){
        view.addSubview(temperatureMin)
        
        temperatureMin.text = " min °C"
        temperatureMin.textAlignment = .left
        temperatureMin.textColor = .label
        temperatureMin.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        temperatureMin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ temperatureMin.topAnchor.constraint(equalTo: temperatureImage.bottomAnchor, constant: 80),
                                      temperatureMin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                      temperatureMin.heightAnchor.constraint(equalToConstant: 20),
                                      temperatureMin.widthAnchor.constraint(equalToConstant: 100)
                                    ])
    }
    
    private func setupNavigationItems(){
        self.navigationItem.title = "Weather"
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addButtonDidTap)),
                                                   UIBarButtonItem(image: UIImage(systemName: "thermometer"), style: .plain, target: self, action: #selector(forecastButtonDidTap)),
                                                   UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refreshButtonDidTap))]
    }
    
    @objc private func addButtonDidTap(){
        
    }
    
    @objc private func forecastButtonDidTap(){
        
    }
    
    @objc private func refreshButtonDidTap(){
        
    }
}

