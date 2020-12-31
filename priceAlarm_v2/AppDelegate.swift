//
//  AppDelegate.swift
//  priceAlarm_v2
//
//  Created by Woohyun Kim on 2020/12/30.
//

import GoogleSignIn
import UIKit
import Firebase


@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("User email: \(user.profile.email ?? "No email")")
        
        guard let authentication = user.authentication else { return }
          let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                            accessToken: authentication.accessToken)
          // ...
        Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        print("authentication error \(error.localizedDescription)")
                    }
                }
    }
    
    
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func application(_app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool{
        return GIDSignIn.sharedInstance().handle(url)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }




