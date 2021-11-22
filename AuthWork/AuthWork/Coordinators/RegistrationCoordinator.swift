//
//  RegistrationCoordinator.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation
import UIKit

class RegistrationCoordinator: Coordinator {
   
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var userData = UserData(login: nil, password: nil)
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showStartViewModule()
    }
    
    private func showStartViewModule() {
        let controller = moduleFactory.createStartViewModule()
        
        controller.completionHandlerAuth = {
            self.showAuthModule()
        }
        
        controller.completionHandlerRegistr = {
            self.showEnterLoginModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showAuthModule() {
        let controller = moduleFactory.createAuthModule()
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterLoginModule() {
        let controller = moduleFactory.createEnterLoginModule()

        controller.completionHandler = { [ weak self ] value in
            self?.userData.login = value
            self?.showEnterPasswordModule()
        }

        navigationController.pushViewController(controller, animated: true)
    }

    private func showEnterPasswordModule() {
        let controller = moduleFactory.createEnterPasswordModule()

        controller.completionHandler = { [ weak self ] value in
            self?.userData.password = value
            self?.flowCompletionHandler?()
        }

        navigationController.pushViewController(controller, animated: true)
    }
}
