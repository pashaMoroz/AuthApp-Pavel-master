//
//  SignUpViewController.swift
//  View Controller Lyfecycle
//
//  Created by Алексей Пархоменко on 28.04.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = 50
        photoImageView.layer.borderWidth = 0.5
        settingsForTextFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signInButton.isEnabled = false
        signInButton.alpha = 0.5
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        var isEmalValidate = false
        if let email = emailTextField.text {
        isEmalValidate = validateEmail(enteredEmail: email)
        }

        if firstNameTextField.text != "" && lastNameTextField.text != "" && passwordTextField.text != "" && isEmalValidate {

            signInButton.isEnabled = true
            signInButton.alpha = 1
        } else {
            signInButton.isEnabled = false
            signInButton.alpha = 0.5
        }

        return true
    }

    @IBAction func photoButtonPressed(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController else { return }
        profileVC.signUpViewController = self
        profileVC.firstname = firstNameTextField.text
        profileVC.lastname = lastNameTextField.text
        profileVC.image = photoImageView.image
        present(profileVC, animated: true, completion: nil)
    }


    //MARK: - SettingsForTextFields

    private func settingsForTextFields() {

        firstNameTextField.tag = 0
        lastNameTextField.tag = 1
        emailTextField.tag = 2
        passwordTextField.tag = 3

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
}


extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

extension SignUpViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
}

