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
        let urlRequest = URL(string: "http://openweathermap.org/img/wn/\(url)@2x.png")
        guard let url = urlRequest else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if data != nil {
                let imageData = try? Data(contentsOf: url)
                let image = UIImage(data: imageData!)
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    completion(image)
                }
            }
        }.resume()
    }
}
