//
//  ModuleFactory.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation

class ModuleFactory {
    
    func createStartViewModule() -> StartViewController {
        StartViewController()
    }
    
    func createAuthModule() -> EnterAuthViewController {
        AuthViewController()
    }
    
    func createEnterLoginModule() -> EnterLoginViewController {
        EnterNameViewController()
    }
    
    func createEnterPasswordModule() -> EnterPasswordViewController {
        EnterPasswordViewController()
    }
}
