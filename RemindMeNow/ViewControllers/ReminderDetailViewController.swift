//
//  ReminderDetailViewController.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/22/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ReminderDetailViewController: UIViewController {
    @IBOutlet weak var titlefield: UITextField!
    var reminder: Reminder?
    var quoteHelper = QuoteHelper()

    @IBOutlet weak var datepicker: UIDatePicker!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    

    }
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var selectedDate: UITextField!
    
    @IBAction func datePickerAction(sender: AnyObject) {
    
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd 'at' h:mm a"
        var strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {
        

            
            let requiredDateComponents: NSCalendarUnit = .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute
            let components = NSCalendar.currentCalendar().components(requiredDateComponents, fromDate: datepicker.date)
            
            let stripedDate = NSCalendar.currentCalendar().dateFromComponents(components)
            
            let aReminder = Reminder()
            aReminder.title = titlefield.text
            aReminder.reminderdate = stripedDate!
            aReminder.quote = quoteHelper.fetchRandomQuote()
                        
            let realm = Realm()
            realm.write {
                realm.add(aReminder)
                
                var localNotification: UILocalNotification = UILocalNotification()
//                localNotification.alertAction = "Testing notifications on iOS8"
                localNotification.alertTitle = aReminder.title
                localNotification.alertBody = aReminder.quote
                localNotification.fireDate = aReminder.reminderdate
                UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
               
                

                
        
                
            }
            

           }
    
    }
}