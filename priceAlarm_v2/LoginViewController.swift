//
//  ViewController.swift
//  priceAlarm_v2
//
//  Created by Woohyun Kim on 2020/12/30.
//

// [0]RequestVC에서의 입력값을 Firbase로 저장하는 것 부터 먼저 구현 -> rules를 !=true로 바꿨는데 이건 개발용 규칙일 가능성있음. 나중에 바꿔야 할 수도
// [0]다른 계정으로 로그인해서 별도 db로 생성되는지 확인
// []FCM으로 각기 다른 UID에게 메세지 보내기
// []game title, currency는 목록에서 선택할 수 있도록 구현
// []뒤로가기를 log out으로 수정
// []로그인 후 딜레이 후 다음 창으로 넘어가는 이슈
// []send button 누르면 동영상 광고 보여주고 팝업창으로 저장 완료 보여주기
// []'가격 검색하러 가기' 버튼 누르면 'SwitchScanner' app 다운로드로 연결
// []'SwitchScanner'에는 'SwitchPriceAlarm' app 다운로드로 연결
// []각 user의 uid를 사용하여 FCM 보내기 구현
// []메인 아이콘 만들기(기존 SwitchScanner와 연계성 필요)
// []구글 로그인 버튼 위치 및 디자인 수정





import UIKit
import FirebaseMessaging
import FirebaseCore
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



