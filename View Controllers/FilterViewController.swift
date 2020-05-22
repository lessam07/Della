//
//  FilterViewController.swift
//  CustomLoginDemo
//
//  Created by Assel Amangeldi on 4/20/20.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit
import SideMenu

class FilterViewController: UIViewController {

    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var maxPriceTextField: UITextField!
    @IBOutlet weak var minPriceTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    
    @IBOutlet weak var menuButton: UIButton!
    
    
    @IBOutlet weak var minWeightTextfield: UITextField!
    
    @IBOutlet weak var maxWeightTextField: UITextField!
    
    @IBOutlet weak var minVolumeTextField: UITextField!
    
    @IBOutlet weak var maxVolumeTextField: UITextField!
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menu =  SideMenuNavigationController(rootViewController: SideMenu())
        
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    Utilities.styleFilledButton(filterButton)

    }
    

    @IBAction func filterButtonTapped(_ sender: Any) {
        transitionToHome()
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
         present(menu!, animated: true)
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
