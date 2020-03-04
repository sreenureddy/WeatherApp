//
//  WeatherWorker.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//
import UIKit

class WeatherWorker {
    func getTheWeatherForcastInformation(postParams: Weather.Forecast.Request, completionHandler: @escaping (_ reposne: WeatherResponse?, _ message: String?) -> Void) {
        let apiManager = APIManager()
        apiManager.fetchResources(postParameters: postParams) { (weatherReponse, statusMessage) in
            completionHandler(weatherReponse, statusMessage)
        }
        
    }
}
