//
//  Page3ViewController.swift
//  Registration Page
//
//  Created by olli on 11.04.19.
//  Copyright © 2019 Oli Poli. All rights reserved.
//

import UIKit

class EmailAndPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var page3Label: UILabel!
    @IBOutlet weak var page3Label2: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user: User?
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImagesForBackground()
        self.hideKeyboardWhenTappedAround()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        if let age = user?.age {
            page3Label.text = "So, you're " + String(age)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: LocationViewController = segue.destination as! LocationViewController
        user?.email = emailTextField.text!
        destViewController.user = user
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
    
    // клавиатура уходит после нажатия на Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}
