//
//  SignupController.swift
//  Projet iOS
//
//  Created by Walid Braham on 25/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit
import FirebaseAuth
import SkyFloatingLabelTextField

class SignupController: UIViewController {

    
    @IBOutlet weak var nameLabel: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailLabel: SkyFloatingLabelTextField!
    
    @IBOutlet weak var passwordLabel: SkyFloatingLabelTextField!
    
    @IBOutlet weak var confirmPasswordLabel: SkyFloatingLabelTextField!
    
    @IBAction func signUpAction(_ sender: Any) {
        if passwordLabel.text != confirmPasswordLabel.text {
            let alertController = UIAlertController(title:"Incorrect Password",
                                                    message:"Verify Password",
                                                    preferredStyle: .alert)
        
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController,animated: true,completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailLabel.text!, password: passwordLabel.text!){
                (user,error) in if error == nil {
                    self.performSegue(withIdentifier: "signupToTableList", sender: self)
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = self.nameLabel.text!
                    changeRequest?.commitChanges{(error) in
                        // ERROR
                    }
                } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated:true,completion: nil)
            }
        }
    
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient()
    }
    
    func gradient() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.1).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.addSublayer(gradientLayer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
