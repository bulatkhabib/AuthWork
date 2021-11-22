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
        EnterAuthViewController()
    }
    
    func createEnterLoginModule() -> EnterLoginViewController {
        EnterLoginViewController()
    }
    
    func createEnterPasswordModule() -> EnterPasswordViewController {
        EnterPasswordViewController()
    }
}
