//
//  Page6ViewController.swift
//  Registration Page
//
//  Created by olli on 11.04.19.
//  Copyright © 2019 Oli Poli. All rights reserved.
//

import UIKit

class FinaleViewController: UIViewController {
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var theEndImageView: UIImageView!
    
    var user: User?
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImagesForBackground()
        setupLabels()
        theEndImageView.image = image
    }
    
    func setupLabels() {
        if let name = user?.name {
            nameLabel.text = "Name: " + name
        }
        
        if let age = user?.age {
            ageLabel.text = "Age: " + age
        }
        
        if let city = user?.city {
            cityLabel.text = "City: " + city
        }
        
        if let email = user?.email {
            emailLabel.text = "Email: " + email
        }
    }
    
    func setImagesForBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "1x")
        view.sendSubviewToBack(backgroundImageView)
    }
}
