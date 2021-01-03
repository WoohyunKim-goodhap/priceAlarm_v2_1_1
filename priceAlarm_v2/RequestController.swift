//
//  RequestController.swift
//  priceAlarm_v2
//
//  Created by Woohyun Kim on 2021/01/02.
//

import UIKit
import Firebase

class RequestController: UIViewController {
    
    @IBOutlet var countryField: UITextField!
    
    @IBOutlet var gameField: UITextField!
    
    @IBOutlet var priceField: UITextField!
    
    let db = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        print("\(userID)")

        db.child("user\(userID)").setValue(["country": "\(countryField.text)", "game": "\(gameField.text)", "price": "\(priceField.text)"])
    }
    
    
    

}

//class RequestController: UIViewController, UITableViewDataSource, UITableViewDelegate{
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//       return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        return cell
//    }
//}
