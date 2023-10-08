//
//  SceneDelegate.swift
//  MVC
//
//  Created by Natalia Hernandez on 7/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else
        {
        return
        }
        let window = UIWindow(windowScene: scene)
        let viewController = SplashViewController()
        viewController.viewModel = SplashViewModel(viewDelegate: viewController)
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }



}

