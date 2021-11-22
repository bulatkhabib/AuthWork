//
//  StartViewController.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation
import UIKit

class StartViewController: UIViewController, FlowController {
    var completionHandler: ((String?) -> ())?
    var completionHandlerAuth: ((String?) -> ())?
    var completionHandlerRegistr: ((String?) -> ())?
    
    // MARK: Private Properties
    
    private var signInButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private var signUpButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    // MARK: Private
    
    private func addSubviews() {
        title = "Welcome"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.frame.size = CGSize(width: 132, height: 100)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc private func signInButtonTapped() {
        completionHandlerAuth
    }
    
    @objc private func signUpButtonTapped() {
        completionHandlerRegistr
    }
}
