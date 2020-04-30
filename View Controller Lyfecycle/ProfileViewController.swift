//
//  ProfileViewController.swift
//  View Controller Lyfecycle
//
//  Created by Алексей Пархоменко on 28.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var firstname: String?
    var lastname: String?
    var image: UIImage?
    var signUpViewController: SignUpViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signUpViewController != nil {
            firstnameTextField.text = firstname
            lastnameTextField.text = lastname
            photoImageView.image = image
        }
    }

    @IBAction func changeInfoTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "backToFirstScreen", sender: nil)
        if signUpViewController != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func shareTapped(_ sender: UIButton) {
        let items = ["1. Купить молоко\n2. Яблоко"]
        guard let image = photoImageView.image else { return }
        let shareController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(shareController, animated: true, completion: nil)
    }
}
