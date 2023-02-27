//
//  CutomImageView.swift
//  WeatherApp
//
//  Created by Ярослав Павловский on 27.02.23.
//

import UIKit

protocol CustomImageViewProtocol {
    func loadImage(url: String?, completion: @escaping (UIImage) -> ())
}

final class CustomImageView: UIImageView {
    
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
}
