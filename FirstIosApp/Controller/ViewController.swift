//
//  ViewController.swift
//  FirstIosApp
//
//  Created by Weerawat Pleanchum on 3/8/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        SVProgressHUD.setDefaultMaskType(.black)
//        SVProgressHUD.show(withStatus: "Hello World")
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://nuuneoi.com/courses/500px/list").responseJSON{response in
//            print(response)
             print("Result: \(response.result)")
           
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

