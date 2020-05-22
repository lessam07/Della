//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Christopher Ching on 2019-07-22.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//
import Alamofire
import UIKit

class SignUpViewController: UIViewController {
let URL_USER_REGISTER = "https://thawing-brook-60057.herokuapp.com/api/register"

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var RepeatPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    var role_id = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }
    
    //Button action
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        //Validate the fields
                let error = validateFields()
        
                if error != nil {
        
                    // There's something wrong with the fields, show error message
                    showError(error!)
                }
                else {
        //creating parameters for the post request
        let parameters: Parameters=[
        "first_name":firstNameTextField.text!,
        "last_name":lastNameTextField.text!,
        
            "email":emailTextField.text!,
            
          "password":passwordTextField.text!,
          
          "c_password":RepeatPasswordTextField.text!,
          "role_id":String(role_id)
        
        ]
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseString
        {
            response in
            //printing response
            print(response)
            
            //getting the json value from the server
            if let result = response.result.value {
                
            }
        }
        self.transitionToHome()
    }
    }
    
    
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(RepeatPasswordTextField)
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
// Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {

        // Check that all fields are filled in
        if
            RepeatPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {

            return "Пожалуйста, заполните все поля."
        }

        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)


//            // Password isn't secure enough
//            return "Пожалуйста, убедитесь, что ваш пароль имеет не менее 8 символов, содержит символ и цифру."
//        }
        
        //Check if passwords are the same
        if passwordTextField.text != RepeatPasswordTextField.text
        {
            return "Пароли не соответствуют"
        }

        return nil
    }
    
// Error message
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
// Transition to home, if ok
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}
