//
//  AddViewController.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/24/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
//    */
//import UIKit
//import Realm
//
//class AddViewController: UIViewController, UITextFieldDelegate {
//    var textField: UITextField?
//    var newItemText: String?
//    
//    override func viewDidLoad() { // [1]
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.whiteColor()
//        setupTextField()
//        setupNavigationBar()
//    }
//    
//    override func viewDidAppear(animated: Bool) { // [2]
//        super.viewDidAppear(animated)
//        textField?.becomeFirstResponder()
//    }
//    
//    func setupTextField() { // [3]
//        textField = UITextField(frame: CGRectZero)
//        textField?.placeholder = "Type in item"
//        textField?.delegate = self
//        view.addSubview(textField!)
//    }
//    
//    func setupNavigationBar() { // [4]
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneAction")
//    }
//    
//    override func viewDidLayoutSubviews() { // [5]
//        super.viewDidLayoutSubviews()
//        let padding = CGFloat(11)
//        textField?.frame = CGRectMake(padding, self.topLayoutGuide.length + 50, view.frame.size.width - padding * 2, 100)
//    }
//    
//    func doneAction() { // [6]
//        let realm = RLMRealm.defaultRealm() // [6.1]
//        //if (self.textField?.text).length > 0 { // [6.2]
//            let Reminder= ReminderItem() // [6.3]
//            REminder.name = self.textField!.text
//            realm.transactionWithBlock(){ // [6.4]
//                realm.addObject(ReminderItem)
//        }
//        dismissViewControllerAnimated(true, completion: nil) // [7]
//    }
//    
//    func textFieldShouldReturn(textField: UITextField!) -> Bool { // [8]
//        doneAction()
//        textField.resignFirstResponder()
//        return true
//    }