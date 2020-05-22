//
//  HomeViewController.swift
//  CustomLoginDemo
//
//
//  Copyright © 2020 Assel AMangeldi. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var orders = [orderStats]()
    var order:orderStats?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = orders[indexPath.row].cargo_name
        return cell
    }
    
    
//    @IBOutlet weak var price: UILabel!
//    @IBOutlet weak var destinationCity: UILabel!
//    @IBOutlet weak var startCity: UILabel!
//    @IBOutlet weak var cargoName: UILabel!
    
    
    

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var solidButton: UIButton!
    @IBOutlet weak var fragileButton: UIButton!
    @IBOutlet weak var liquidButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
        menu =  SideMenuNavigationController(rootViewController: SideMenu())
        
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        setUpElements()
        
        downloadJSON {
            self.tableView.reloadData()
        }
        
        tableView.delegate=self
        tableView.dataSource=self
//        price.text = order?.price
//        startCity.text = order?.start_city_name(nam)
//        destinationCity.text = order?.destination_city_name
        
    }
    
    
    @IBAction func didTappedMenu(_ sender: Any) {
        present(menu!, animated: true)
    }
    

    func downloadJSON (completed: @escaping () -> ()){
                        
    let url = URL(string: "https://thawing-brook-60057.herokuapp.com/api/order")
    //                    guard let url = URL(string: jsonUrlString) else {return}
                        
    URLSession.shared.dataTask(with: url!){ (data, response, err) in
                            
        if err == nil {
            do {
    self.orders = try JSONDecoder().decode([orderStats].self, from: data!)
                DispatchQueue.main.async {
                    completed()
                }
                completed()
    
                            }
                            catch let error {
                                print (error)
                            }
        }
                        }.resume()
            }
    
    func setUpElements() {
    
    
        // Style the elements
        Utilities.styleCategoryButton(solidButton)
        Utilities.styleCategoryButton(liquidButton)
        Utilities.styleCategoryButton(softButton)
        Utilities.styleCategoryButton(fragileButton)

    }
    
    
    }

