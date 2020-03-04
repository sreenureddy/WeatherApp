//
//  WeatherModels.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//


import UIKit

enum Weather {
    // MARK: Use cases
    enum Forecast {
        struct Request {
            var locationId: String?
            var appId: String?
        }
        struct Response {
            var response: WeatherResponse?
        }
        struct ViewModel {
            var descrption: String?
            var speed: String?
        }
    }
}
