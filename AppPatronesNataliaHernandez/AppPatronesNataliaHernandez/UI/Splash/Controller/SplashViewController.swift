//
//  SplashViewController.swift
//  MVC
//
//  Created by Natalia Hernandez on 7/10/23.
//

import UIKit
//MARK: - PROTOCOLO
protocol SplashViewProtocol: AnyObject{
    func showLoading(_ show: Bool)
    func navigateToHome()
}

//MARK: - CLASE -

class SplashViewController: UIViewController {
    
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
        print("Hola mucho gusto, yo soy el splash view controller")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
        
    }

}

//MARK: - EXTENSION -
extension SplashViewController: SplashViewProtocol{
    func showLoading(_ show: Bool) {
        func showLoading(_ show: Bool){
            switch show{
            case true where !activityIndicator.isAnimating:
                activityIndicator.startAnimating()
            case false where activityIndicator.isAnimating:
                activityIndicator.stopAnimating()
            default: break
            }
        }
    }
    
    func navigateToHome() {
        //TODO: Navegar al home
        let homeVC = HomeTableViewController()
        homeVC.viewModel = HomeViewModel(viewDelegate: homeVC)
        navigationController?.setViewControllers(
            [homeVC], animated: true)
    }
    
    
}
