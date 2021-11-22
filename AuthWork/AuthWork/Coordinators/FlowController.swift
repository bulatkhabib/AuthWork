//
//  FlowController.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
