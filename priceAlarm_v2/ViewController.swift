//
//  ViewController.swift
//  priceAlarm_v2
//
//  Created by Woohyun Kim on 2020/12/30.
//

import UIKit
import FirebaseDatabase
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var signInButton: GIDSignInButton!
    
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
// 아래 코드들을 별도 뷰로 옮기고 UID를 setchild를 사용해 각 key, value를 저장하기
//        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 50))
//        button.setTitle("Add Entry", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .link
//        view.addSubview(button)
//        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
//
    }
    
//    @objc private func addNewEntry() {
//        let object: [String: Any] = ["game title": "splatoon", "country": "Korea", "price": 100]
//        database.child("something").setValue(object)
//    }


}

