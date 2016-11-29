//
//  ReviewViewController.swift
//  OurBab
//
//  Created by TChoi on 25/11/2016.
//  Copyright © 2016 T. Choi. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    
    // For exercise #1  after this, outlet should be connected!
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurant:RestaurantMO?
    
    // For exercise #2
    @IBOutlet var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Solution to Exercise #1 - Start here
        if let restaurant = restaurant {
            restaurantImageView.image = UIImage(data: restaurant.image as! Data)
            //            restaurantImageView.image = UIImage(named: restaurant.image)
        }
        // Solution to Exercise #1 - End here
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // View animation
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        //        containerView.transform = CGAffineTransform.init(translationX: 0, y: -1000)
        //        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        
        // Solution to Exercise #2 - Start here
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) { UIView.animate(withDuration: 0.1, animations: {
        
        self.containerView.transform = CGAffineTransform.identity })
        
        
        // Solution to Exercise #2
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            
            self.closeButton.transform = CGAffineTransform.identity
            
        }, completion: nil)
        
    }
    
    
}
