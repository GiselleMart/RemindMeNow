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
        //sself.remindercell.separatorColor = [UIColor,clearColor];
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var selectedDate: UITextField!
    
    @IBAction func datePickerAction(sender: AnyObject) {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {

            
            
            
            let aReminder = Reminder()
            aReminder.title = titlefield.text
            aReminder.reminderdate = datepicker.date
            aReminder.quote = quoteHelper.fetchRandomQuote()
                        
            let realm = Realm()
            realm.write {
                realm.add(aReminder)
                
            //let Quote
                
            }
            
            
        }
        
    }
    
}