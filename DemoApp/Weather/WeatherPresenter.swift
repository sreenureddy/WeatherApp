//
//  WeatherPresenter.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//
import UIKit

protocol WeatherPresentationLogic {
  func presentSomething(response: [Weather.Forecast.ViewModel])
}

class WeatherPresenter: WeatherPresentationLogic {
    weak var viewController: WeatherDisplayLogic?
    // MARK: Do something
    func presentSomething(response: [Weather.Forecast.ViewModel]) {
        viewController?.displayWeatherInformation(viewModel: response)
    }
}
