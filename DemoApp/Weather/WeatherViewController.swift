//
//  WeatherViewController.swift
//  DemoApp
//
//  Created by sreenu ramana on 4/3/20.
//  Copyright (c) 2020 sreenu ramana. All rights reserved.
//


import UIKit

protocol WeatherDisplayLogic: class {
    func displayWeatherInformation(viewModel: [Weather.Forecast.ViewModel])
}

class WeatherViewController: UITableViewController, WeatherDisplayLogic {
    var interactor: WeatherBusinessLogic?
    var router: (NSObjectProtocol & WeatherRoutingLogic & WeatherDataPassing)?
    var weatherInfo: [Weather.Forecast.ViewModel] = [Weather.Forecast.ViewModel]()
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = WeatherInteractor()
        let presenter = WeatherPresenter()
        let router = WeatherRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather Information"
        self.fecthWeaherforecastInformation()
        
    }
    
    func fecthWeaherforecastInformation() {
        var request = Weather.Forecast.Request()
        request.appId = appId
        request.locationId = "5"
        interactor?.getWeatherInformation(request: request)
    }
    
    func displayWeatherInformation(viewModel: [Weather.Forecast.ViewModel]) {
        self.weatherInfo = viewModel
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
        
    }
}

extension WeatherViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherInfo.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        let viewModel = weatherInfo[indexPath.row]
        cell.option(data: viewModel)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154.0
    }
}
