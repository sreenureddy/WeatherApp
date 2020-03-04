//
//  WeatherRouter.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//


import UIKit

@objc protocol WeatherRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol WeatherDataPassing {
    var dataStore: WeatherDataStore? { get }
}

class WeatherRouter: NSObject, WeatherRoutingLogic, WeatherDataPassing {
    weak var viewController: WeatherViewController?
    var dataStore: WeatherDataStore?
// MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: WeatherViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: WeatherDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
