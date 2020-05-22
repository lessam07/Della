

import Foundation
import UIKit

class Utilities {
    static func styleLabel (_ label:UILabel){
        
       label.textColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1.0)
    
    }
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
//        let bottomLine = CALayer()
//
//        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
//
//        bottomLine.backgroundColor = UIColor.init(red: 82/255, green: 172/255, blue: 170/255, alpha: 1).cgColor
        // Custom color to border
        let myColor : UIColor = UIColor( red: 82/255, green: 172/255, blue:170/255, alpha: 1.0 )
//         let placeholderColor : UIColor = UIColor( red: 151/255, green: 151/255, blue:151/255, alpha: 1.0 )
        // Remove border on text field
        textfield.layer.borderWidth = 1.0
        textfield.layer.cornerRadius = 7.0
        textfield.layer.borderColor = myColor.cgColor
//        textfield.attributedPlaceholder=NSAttributedString(string: "",
//        attributes: [NSAttributedString.Key.foregroundColor: UIColor( red: 151/255, green: 151/255, blue:151/255, alpha: 1.0 )])
        
        
        // Add the line to the text field
//        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 82/255, green: 172/255, blue: 170/255, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.white
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 1.0
    
    }
    
    static func linkedButton(_ button:UIButton){
        
        button.setTitleColor(UIColor( red: 82/255, green: 172/255, blue:170/255, alpha: 1.0 ), for: .normal)
        
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = UIColor.init(red: 82/255, green: 172/255, blue: 170/255, alpha: 1)
               button.layer.cornerRadius = 25.0
               button.tintColor = UIColor.white
               button.layer.shadowColor = UIColor.gray.cgColor
               button.layer.shadowOffset = CGSize(width: 5, height: 5)
               button.layer.shadowRadius = 5
               button.layer.shadowOpacity = 1.0
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func styleCategoryButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 82/255, green: 172/255, blue: 170/255, alpha: 1)
        button.layer.cornerRadius = 10.0
        button.tintColor = UIColor.white
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 1.0
    
    }
    
    
}
