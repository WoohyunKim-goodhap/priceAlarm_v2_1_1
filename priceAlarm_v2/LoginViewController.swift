//
//  ViewController.swift
//  priceAlarm_v2
//
//  Created by Woohyun Kim on 2020/12/30.
//

import UIKit
import FirebaseDatabase
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController{
    
    
    @IBOutlet var signInButton: GIDSignInButton!
    
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }

    @IBAction func loginBtnClicked(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
}

extension LoginViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {

             print(error)

             return
         }

//         guard let email = user.profile.email else { return }

         guard let authentication = user.authentication else { return }

           let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                     accessToken: authentication.accessToken)
       Auth.auth().signIn(with: credential) { (authResult, error) in
         if let error = error {
          print(error)
           return
         }

         //If login is successful then add
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "RequestController"){
            self.navigationController?.pushViewController(controller, animated: true)
        }
        //OR
//        self.performSegue() //<-- Whatever goes in here, I don't use these methods as I create views programitacally, but you can use it here and move to next view
        
       }

      }
    
    
    
}



