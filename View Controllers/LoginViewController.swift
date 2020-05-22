//
//  LoginViewController.swift
//  CustomLoginDemo
//
//  Created by Assel Amangeldi on 2020-02-12.
//  Copyright © 2020 Assel Amangeldi. All rights reserved.
//
import Alamofire
import UIKit

class LoginViewController: UIViewController {
let URL_USER_LOGIN = "https://thawing-brook-60057.herokuapp.com/api/login"

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    

    @IBOutlet weak var rememberMeLabel: UILabel!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleLabel(forgotPasswordLabel)
        Utilities.styleLabel(rememberMeLabel)
    }
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
let parameters: Parameters=[

    "email":emailTextField.text!,
    
  "password":passwordTextField.text!

]
Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseString
                {
response in

//print(response)
//print("Success: \(response.result.isSuccess)")
                    
// Sign in error
// If ok, transit to home page
if response.response?.statusCode == 200 {
let parameters: Parameters=[

    "email":self.emailTextField.text!,
                            
    "password":self.passwordTextField.text!

                        ]
    Alamofire.request(self.URL_USER_LOGIN, method: .post, parameters: parameters).responseString
        {
    response in
    print(response)
        
        transitionToHome()
                        
    }
                        
                        
}
                    
else {

    let error = validateFields()
    showError(error!)
    print(response)
    
                                           
    }

        
}

    
   func validateFields() -> String? {
        
        // Check that all fields are filled in
        
            return "Неправильная почта или пароль."
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    }
    

}
