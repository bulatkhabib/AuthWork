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
    
    private let moduleFactory = ModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showStartViewModule()
    }
    
    private func showStartViewModule() {
        let controller = moduleFactory.createStartViewModule()
        
        controller.completionHandlerAuth = { [ weak self ] in
            self?.showAuthModule()
        }
        
        controller.completionHandlerRegistration = { [ weak self ] in
            self?.showEnterLoginModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showAuthModule() {}
    
    private func showEnterLoginModule() {
        let controller = moduleFactory.createEnterLoginModule()
        
        controller.completionHandler = { [ weak self ] in
            self?.showEnterPasswordModule()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showEnterPasswordModule() {
        let controller = moduleFactory.createEnterPasswordModule()
        
        controller.completionHandler = { [ weak self ] in
            self?.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
