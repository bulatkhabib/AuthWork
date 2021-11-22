//
//  EnterAuthViewController.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation
import UIKit

class EnterAuthViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> ())?
    
    private var userData: UserData!
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter name"
        
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter name"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func setup(userData: UserData) {
        self.userData = userData
    }
    
    private func addSubviews() {
        
        title = "Enter Data"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField, nextButton])
        stackView.frame.size = CGSize(width:  132, height: 220)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc private func nextButtonTapped() {
        if nameTextField.text != nil && passwordTextField.text != "" {
            completionHandler?("")
        } else {
            print("error")
        }
    }
}
