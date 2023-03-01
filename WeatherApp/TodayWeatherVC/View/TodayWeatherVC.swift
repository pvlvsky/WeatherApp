//
//  TodayWeatherVC.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 23.02.23.
//

import UIKit

final class TodayWeatherVC: UIViewController {
    
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
        self.view.backgroundColor = .black
    }
    
    private func setupNavigationItems(){
        self.navigationItem.title = "Weather"
        self.navigationItem.titleView?.backgroundColor = .white
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addButtonDidTap))]
    }
    
    @objc func addButtonDidTap(){
        let alert = UIAlertController(title: "Add city", message: "Use english city names only", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "City name"
        }
        
        let addDidTap = UIAlertAction(title: "Add", style: .default) { _ in
            guard let city = alert.textFields?.first?.text?.capitalized else { return }
            self.weatherModel.startFetch(city)
            self.updateView()
        }
        let cancelDidTap = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(addDidTap)
        alert.addAction(cancelDidTap)
        present(alert, animated: true)
    }
    
}
