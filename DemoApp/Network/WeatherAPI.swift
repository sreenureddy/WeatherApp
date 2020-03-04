//
//  WeatherAPI.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright © 2020 sreenu ramana. All rights reserved.
//

import Foundation

let appId = "44ddb6632dc5bbbdd419560abf25e528"

enum PostParamKeys: String {
    case id
    case lang
    case appid
}

var baseURL: URL {
    guard let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast?id") else {
        fatalError("base url could not configured")
    }
    return url
}

public enum APIServiceError: Error {
       case apiError
       case invalidEndpoint
       case invalidResponse
       case noData
       case decodeError
}

