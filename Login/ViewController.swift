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
    
    @IBAction func action_login(_ sender: AnyObject) {
        if let password = users[tf_user.text!]
        {
            if password == tf_password.text
            {
                print("Đăng nhập thành công")
                // addUserBtn.isHidden = false
                editUserBtn.isHidden = false
                if users[tf_user.text!] == "admin" {
                    removeUserBtn.isHidden = false
                } else {
                    print("normal user")
                }
                
            }
            else
            {
                print("Mật khẩu không đúng")
            }
        }
        else
        {
            print("Tài khoản không tồn tại")
        }
    }
}

