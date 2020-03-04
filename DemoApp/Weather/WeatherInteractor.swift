//
//  WeatherInteractor.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//


import UIKit

protocol WeatherBusinessLogic {
    func getWeatherInformation(request: Weather.Forecast.Request)
}

protocol WeatherDataStore {
    //var name: String { get set }
}

class WeatherInteractor: WeatherBusinessLogic, WeatherDataStore {
    
    var presenter: WeatherPresentationLogic?
    var worker: WeatherWorker?
    
    func getWeatherInformation(request: Weather.Forecast.Request) {
        worker = WeatherWorker()
        worker?.getTheWeatherForcastInformation(postParams: request, completionHandler: { (weatherReponse, message) in
            guard let data = weatherReponse else { return }
            let response = self.getTheWeatherData(response: data)
            self.presenter?.presentSomething(response: response)
        })
    }
    
    func getTheWeatherData(response: WeatherResponse) -> [Weather.Forecast.ViewModel] {
        var viewModel = [Weather.Forecast.ViewModel]()
        guard let weatherInfo = response.list, weatherInfo.count > 0 else {
            return viewModel
        }
        for weatherObj in weatherInfo.enumerated() {
            var model = Weather.Forecast.ViewModel()
            model.descrption = weatherObj.element.weather?.first?.description
            model.speed = weatherObj.element.wind?.speed?.description
            viewModel.append(model)
        }
        return viewModel
    }
}
