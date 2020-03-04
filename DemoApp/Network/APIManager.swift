//
//  APIManager.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright © 2020 sreenu ramana. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    case clientError = "Client error!"
    case serverError = "Server error!"
    case mimeError = "Wrong MIME type!"
}

class APIManager {
    
    private let urlSession = URLSession.shared
    
    func fetchResources(postParameters: Weather.Forecast.Request, completionHandler: @escaping (_ sucess: WeatherResponse?, _ message: String?) -> Void) {
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else { return }
        let queryItems = [
            URLQueryItem(name: PostParamKeys.id.rawValue, value: postParameters.locationId),
            URLQueryItem(name: PostParamKeys.appid.rawValue, value: postParameters.appId)
        ]
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else { return }
        let task = urlSession.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                completionHandler(nil, ErrorMessage.clientError.rawValue)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHandler(nil, ErrorMessage.serverError.rawValue)
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                completionHandler(nil, ErrorMessage.mimeError.rawValue)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(WeatherResponse.self, from: data!)
                completionHandler(responseModel, nil)
            } catch {
                let message = "JSON error: \(error.localizedDescription)"
                completionHandler(nil, message)
            }
        }
        task.resume()
    }
}
