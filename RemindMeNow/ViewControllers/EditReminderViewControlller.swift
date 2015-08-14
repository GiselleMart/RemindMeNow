//
//  EditReminderViewControlller.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 8/14/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit
import RealmSwift

class EditReminderViewControlller: UIViewController {

    @IBOutlet weak var TitleofReminder: UITextField!
    @IBOutlet weak var TimeofReminder: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var titleOfReminder = ""
    var timeOfReminder: NSDate?
    
    var editedReminder: Reminder?
    
    let realm = Realm()
//        didSet {
//            displayTitle(editedReminder)
//            displayTime(editedReminder)
//        }
//    }
    
//    func displayTitle(reminder: Reminder?) {
//        if let reminder = reminder, TitleofReminder = TitleofReminder {
//            reminder.title = self.editedReminder!.title
//        }
//    }
//    
//    func displayTime(reminder: Reminder?) {
//        if let reminder = reminder, TimeofReminder = TimeofReminder {
//            
//        }
//    }

    func saveReminder() {
        if let editedReminder = editedReminder, TitleofReminder = TitleofReminder, TimeofReminder = TimeofReminder {
            
            self.realm.write() {
                
                if ((editedReminder.title != self.TitleofReminder.text)) {
                    //(editedReminder.reminderdate != //The date given from the datePicker )) {
                        
                        editedReminder.title = self.TitleofReminder.text
                        //editedReminder.reminderdate = //The date given from the datePicker
                        
                } else {
                    println("YOU DIDNT CHANGE ANYTHING")
                }
                
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd 'at' h:mm a"
        var stringDate = dateFormatter.stringFromDate(self.timeOfReminder!)
        println(self.timeOfReminder?.description)
        self.TitleofReminder.text = titleOfReminder
        self.TimeofReminder.text = stringDate
        
        println(self.editedReminder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When we go to segue, call saveDate!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {
            println("We are saving!")
            
            saveReminder()
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
