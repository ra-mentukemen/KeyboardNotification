//
//  ViewController.swift
//  KeyboardNotification
//
//  Created by Daisuke on 2017/07/13.
//  Copyright © 2017年 ra-mentukemen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //登録
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func keyboardWillShow(_ notification: NSNotification) {
        
        guard let userinfo = notification.userInfo, let keyboard = userinfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let viewHeight = view.frame.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let keyboardHeight = keyboard.cgRectValue.height
        let margin: CGFloat = 10 //分かりやすように余白
        textView.frame.size.height = viewHeight - statusBarHeight - keyboardHeight - margin
    }

}

