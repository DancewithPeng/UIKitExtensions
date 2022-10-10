//
//  UITextViewExtensionViewController.swift
//  UIKitExtensionsExample
//
//  Created by DancewithPeng on 2019/7/18.
//  Copyright © 2019 dancewithpeng@gmail.com. All rights reserved.
//

import UIKit

class UITextViewExtensionViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        textView.setLimiter { (textView, text) -> Bool in
//            return text.count <= 10
//        }
        
        textView.setLimiter { $1.count <= 10 }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
