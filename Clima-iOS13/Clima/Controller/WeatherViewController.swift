//
//  ViewController.swift
//  Clima
//
//  Created by 李茜 on 18/9/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.deletgate = self
        weatherManager.fetchWeatherByCityName(cityName: "Alameda")
    }

    
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchTextField.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Please enter a city name"
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = textField.text {
            weatherManager.fetchWeatherByCityName(cityName: city)
            //weatherManager.fetchWeatherByGeo(lat: 31.2322758, lon: 121.4692071)
        }
        
        textField.text = ""
    }
}


// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherData: WeatherModel) {
        print(weatherData.tempStr)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherData.tempStr
            self.conditionImageView.image = UIImage(systemName: weatherData.conditionName)
        }
    }
    
    func didUpdateGeo(_ location: GeoData) {
        print("lat: \(location.lat), lon: \(location.lon)")
        weatherManager.fetchWeatherByGeo(lat: location.lat, lon: location.lon)
        DispatchQueue.main.async {
            self.cityLabel.text = location.name
        }
    }
}
