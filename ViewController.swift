//
//  ViewController.swift
//  TestSendData
//
//  Created by A1 on 12/3/19.
//  Copyright © 2019 AlanWalker. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func Login_Click(_ sender: UIButton) {

        let parameters: [String: String] = ["username": txtUserName.text! , "password": txtPassword.text!,"email": txtEmail.text!]
         let myUrl = URL(string: "http://192.168.61.64/try/login.php")!

       var request = URLRequest(url: myUrl)
               request.httpMethod = "POST"// Compose a query string
               request.addValue("application/json", forHTTPHeaderField: "content-type")
               request.addValue("application/json", forHTTPHeaderField: "Accept")
       
       do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            print(request)
            } catch let error {
                print(error.localizedDescription)
                print("Something went wrong. Try again.")
                return
            }
            
         let task = URLSession.shared.dataTask(with: request) { (data, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("Could not successfully perform this request. Please try again later")
                print("error=\(String(describing: error))")
                return
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                print(responseJSON)
//            }
        }
        task.resume()
        
    }
}

