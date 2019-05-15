//
//  Page5ViewController.swift
//  Registration Page
//
//  Created by olli on 11.04.19.
//  Copyright © 2019 Oli Poli. All rights reserved.
//

import UIKit

class PhotoAndCameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let backgroundImageView = UIImageView()
    
    @IBOutlet weak var addPhotoImageView: UIImageView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImagesForBackground()
    }

    @IBAction func chooseImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Sourse", message: "Choose a sourse", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera not varible")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        addPhotoImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: FinaleViewController = segue.destination as! FinaleViewController

        if addPhotoImageView.image !== nil {
            destViewController.image = addPhotoImageView.image!
        } else {
            destViewController.image = randomImage()
        }
        
        destViewController.user = user
    }
    
    func randomImage() -> UIImage {
        let image1 = UIImage(named: "1")
        let image2 = UIImage(named: "2")
        let image3 = UIImage(named: "3")
        let image4 = UIImage(named: "4")
        let image5 = UIImage(named: "5")
        let image6 = UIImage(named: "6")
        let image7 = UIImage(named: "7")
        let image8 = UIImage(named: "8")
        let image9 = UIImage(named: "9")
        let image10 = UIImage(named: "10")
        let image11 = UIImage(named: "11")
        let image12 = UIImage(named: "12")
        let image13 = UIImage(named: "13")
        let image14 = UIImage(named: "14")
        let image15 = UIImage(named: "15")
        let image16 = UIImage(named: "16")
        let image17 = UIImage(named: "17")
        
        let imageArray = [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13, image14, image15, image16, image17]
        let randomImage = imageArray.randomElement()
        return randomImage as! UIImage
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
