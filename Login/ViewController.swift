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
    var users = ["hung":"123456", "hung1":"123", "hung2":"567"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func action_login(_ sender: AnyObject) {
        if let password = users[tf_user.text!]
        {
            if password == tf_password.text
            {
                print("Đăng nhập thành công")
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

