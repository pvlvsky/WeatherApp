//
//  TodayWeatherVC.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import UIKit

class TodayWeatherVC: UIViewController {
    
    private var todayWeatherView: TodayWetherView!
    var weatherModel: TodayWeatherViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherModel = TodayWeatherViewModel()
        createView()
        setupView()
        setupNavigationItems()
        
    }
    
    func updateView() {
        weatherModel.updateData = { [weak self] dataModel in
            self?.todayWeatherView.todayWeatherData = dataModel
        }
    }
    
    private func createView() {
        todayWeatherView = TodayWetherView()
        todayWeatherView.frame = view.frame
        todayWeatherView.center = view.center
        view.addSubview(todayWeatherView)
    }
    
    private func setupView(){
        self.view.backgroundColor = .systemBackground
    }
    
    func setupNavigationItems(){
        self.navigationItem.title = "Weather"
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addButtonDidTap))]
    }
    
}
