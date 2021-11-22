//
//  AppCoordinator.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        var isAuth = false
        
        if isAuth {
            showMainFlow()
        } else {
            showRegistrationFlow()
            isAuth = true
        }
    }
    
    private func showRegistrationFlow() {
        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)
        
        childCoordinators.append(registrationCoordinator)
        
        registrationCoordinator.flowCompletionHandler = { [ weak self ] in
            self?.showMainFlow()
        }
        
        registrationCoordinator.start()
    }
    
    private func showMainFlow() {
        navigationController.pushViewController([MainViewController()], animated: true)
    }
}
