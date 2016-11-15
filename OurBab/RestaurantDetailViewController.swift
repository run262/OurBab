//
//  RestaurantDetailViewController.swift
//  OurBab
//
//  Created by TChoi on 08/11/2016.
//  Copyright © 2016 T. Choi. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    
    //    var restaurantImage = ""
    //    var restaurantName = ""
    //    var restaurantType = ""
    //    var restaurantLocation = ""
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        restaurantImageView.image = UIImage(named: restaurantImage)
        //        restaurantNameLabel.text = restaurantName
        //        restaurantTypeLabel.text = restaurantType
        //        restaurantLocationLabel.text = restaurantLocation
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
