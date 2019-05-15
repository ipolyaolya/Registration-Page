//
//  Page2ViewController.swift
//  Registration Page
//
//  Created by olli on 10.04.19.
//  Copyright © 2019 Oli Poli. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var howOldAreYouLabel: UILabel!
    @IBOutlet weak var dataOfBirthLabel: UILabel!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    
    var ageNew : Int = 0
    var user: User?
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImagesForBackground()
        colorDatePicker()
        
        if let name = user?.name {
            howOldAreYouLabel.text = name + ", how old are you?"
        }
    }
    
    @IBAction func dataAction(_ sender: Any){
        
        let now = Date()
        let birthday: Date = dateOfBirthDatePicker.date
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        ageNew = age
        print(ageNew)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: EmailAndPasswordViewController = segue.destination as! EmailAndPasswordViewController
        user?.age = String(ageNew)
        destViewController.user = user
    }
    
    // цвет UIDatePicker
    func colorDatePicker() {
        dateOfBirthDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
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
