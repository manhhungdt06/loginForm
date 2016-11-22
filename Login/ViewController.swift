//
//  ViewController.swift
//  Login
//
//  Created by techmaster on 10/25/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_user: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var addUserBtn: UIButton!
    @IBOutlet weak var editUserBtn: UIButton!
    @IBOutlet weak var removeUserBtn: UIButton!
    var users = ["admin":"admin", "hung1":"123", "hung2":"567"]
    override func viewDidLoad() {
        super.viewDidLoad()
        editUserBtn.isHidden = true
        removeUserBtn.isHidden = true
    }

    @IBAction func addUser(_ sender: UIButton) {
        print("users.count = \(users.count)")
        if tf_user.text != "" {
            users[tf_user.text!] = tf_password.text!
            print("users.count = \(users.count)")
            print(users)
        } else {
            print("input something")
        }
    }
    
    @IBAction func editUser(_ sender: UIButton) {
        if tf_user.text != "" {
            if users[tf_user.text!] == nil {
                print("\(tf_user.text!) not exist")
            } else {
                users[tf_user.text!] = tf_password.text!
                print("key-value after update: \(tf_user.text!) and \(tf_password.text!)")
                print(users)
            }
        } else {
            print("input something")
        }
    }
    
    @IBAction func removeUser(_ sender: UIButton) {
        if tf_user.text != "" {
            if users[tf_user.text!] == nil {
                print("\(tf_user.text!) not exist")
            } else {
                if tf_user.text! == "admin" {
                    print("can't remove")
                } else {
                    users.removeValue(forKey: tf_user.text!)
                    print("users.count = \(users.count)")
                    print(users)
                }
            }
        } else {
            print("input something")
        }
    }
    //Get Path
    func getPath() -> String {
        let plistFileName = "data.plist"
        //        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let paths = "/Users/techmaster/loginForm/Login"
        let documentPath = paths as NSString
        let plistPath = documentPath.appendingPathComponent(plistFileName)
        
        return plistPath
    }
    
    func checkUserExist(userName: String) -> Bool {
        
        let plistPath = self.getPath()
        print("plistPath display = \(plistPath)")
        if FileManager.default.fileExists(atPath: plistPath) {
            if let usersData = NSMutableDictionary(contentsOfFile: plistPath) {
                print("usersData = \(usersData)")
                for (_, element) in usersData.enumerated() {
                    if userName == String(describing: element.key) {
                        return true
                    }
//                    print("zzz: \(element.key) --> \(element.value) \n")
                }
            }
        }
        
        return false
    }
    
    //Display Nation and Capital
    func displayResult() {
        let plistPath = self.getPath()
        print("plistPath display = \(plistPath)")
        if FileManager.default.fileExists(atPath: plistPath) {
            if let usersData = NSMutableDictionary(contentsOfFile: plistPath) {
                print("usersData = \(usersData)")
                for (_, element) in usersData.enumerated() {
                    print("zzz: \(element.key) --> \(element.value) \n")
                }
            }
        }
    }
    
    @IBAction func action_signin(_ sender: AnyObject) {
        // tuong tu action add new user
        
        print("users.count = \(users.count)")
        if tf_user.text != "" {
            
            if checkUserExist(userName: tf_user.text!) {
                
                let alertController = UIAlertController(title: "Error", message: "Exist user", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                alertController.addAction(alertAction)
                present(alertController, animated: true, completion: nil)
                
                print("Exist user")
            } else {
//                users[tf_user.text!] = tf_password.text!
                
                /* write to plist file */
                let plistPath = self.getPath()
                print("plistPath exportData = \(plistPath)")
                if FileManager.default.fileExists(atPath: plistPath) {
//                    print("Income")
                    let usersData = NSMutableDictionary(contentsOfFile: plistPath)!
                    if (tf_password.text! == "" || tf_user.text! == "") {
                        
                        let alertController = UIAlertController(title: "Error", message: "Oops, can't empty this field", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        present(alertController, animated: true, completion: nil)
                        
                        print("Oops, can't empty this field")
                    } else {
                        usersData.setValue(tf_password.text!, forKey: tf_user.text!)
                        usersData.write(toFile: plistPath, atomically: true)
                    }
                }
                tf_user.text = ""
                tf_password.text = ""
                displayResult()
            }
  
//            print("users.count = \(users.count)")
//            print(users)
        } else {
            
            let alertController = UIAlertController(title: "Error", message: "input something", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            print("input something")
        }
    }
    
    @IBAction func action_login(_ sender: AnyObject) {
        editUserBtn.isHidden = true
//        if let password = users[tf_user.text!]
//        {
//            if password == tf_password.text
//            {
//                print("Đăng nhập thành công")
//                // addUserBtn.isHidden = false
//                editUserBtn.isHidden = false
//                if users[tf_user.text!] == "admin" {
//                    removeUserBtn.isHidden = false
//                } else {
//                    print("normal user")
//                }
//                
//            }
//            else
//            {
//                print("Mật khẩu không đúng")
//            }
//        }
        
        if checkUserExist(userName: tf_user.text!) {
            let plistPath = self.getPath()
            if FileManager.default.fileExists(atPath: plistPath) {
                if let usersData = NSMutableDictionary(contentsOfFile: plistPath) {
                    for (_, element) in usersData.enumerated() {
                        if tf_user.text == String(describing: element.key) {
                            if tf_password.text == String(describing: element.value) {
                                let alertController = UIAlertController(title: "Error", message: "Đăng nhập thành công", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                present(alertController, animated: true, completion: nil)
                                print("Đăng nhập thành công")
                                editUserBtn.isHidden = false
                            } else {
                                let alertController = UIAlertController(title: "Error", message: "Mật khẩu không đúng", preferredStyle: .alert)
                                let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
                                alertController.addAction(alertAction)
                                present(alertController, animated: true, completion: nil)
                                print("Mật khẩu không đúng")
                            }
                        }
                    }
                }
            }
        }
        else {
            let alertController = UIAlertController(title: "Error", message: "Tài khoản không tồn tại, sign in?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Try Again", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            print("Tài khoản không tồn tại, sign in?")
        }
    }
}

