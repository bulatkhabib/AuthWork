//
//  EnterPasswordViewController.swift
//  AuthWork
//
//  Created by Булат Хабибуллин on 22.11.2021.
//

import Foundation
import UIKit

class EnterPasswordViewController: UIViewController, FlowController {
    
    var completionHandler: ((String?) -> ())?
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return nextButton
    }()
    
    private var userData: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func setup(userData: UserData) {
        self.userData = userData
    }
    
    private func addSubviews() {
        
        title = "Enter Password"
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [textField, nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc private func nextButtonTapped() {
        if textField.text != nil {
            completionHandler?(textField.text)
        } else {
            print("error")
        }
    }
}
