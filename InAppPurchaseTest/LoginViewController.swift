//
//  LoginViewController.swift
//  InAppPurchaseTest
//
//  Created by 신동희 on 2022/11/29.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Propertys
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var user = User(email: "", password: "", check: "")
    var validator = Validator()
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.accessibilityIdentifier = "descriptionLabel"
    }
    
    

    
    // MARK: - Methods
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        descriptionLabel.text = "로그인 버튼을 눌렀습니다."
        
        user = User(email: emailTextField.text!, password: passwordTextField.text!, check: checkTextField.text!)
        
        if validator.isValidEmail(email: user.email) && validator.isValidPassword(password: user.password) && validator.isEqualPassword(password: user.password, check: user.check) {
            
        }
        
//        if isValidEmail() && isValidPassword() && isEqualPassword() {
//            print("로그인 성공")
//        }else {
//            print("로그인 실패")
//        }
    }
    
    
    func isValidEmail() -> Bool {
        guard let email = emailTextField.text else { return false }
        return email.contains("@") && email.count > 8
    }
    
    
    func isValidPassword() -> Bool {
        guard let password = passwordTextField.text else { return false }
        return password.count >= 6 && password.count < 12
    }
    
    
    func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text,
              let check = checkTextField.text else { return false }
        return password == check
    }
    
}




// MARK: - 유효성 검증 테스트를 위한 로직 분리

final class Validator {
    
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.count >= 8
    }
    
    
    func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count < 12
    }
    
    
    func isEqualPassword(password: String, check: String) -> Bool {
        return password == check
    }
    
}


struct User {
    let email: String
    let password: String
    let check: String
}
