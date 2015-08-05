//
//  NoteTableViewCell.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/20/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import Foundation
import UIKit

class ReminderTableViewCell: SBGestureTableViewCell {
    
    
    // initialize the date formatter only once, using a static computed property
    static var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        // MMM d, yyyy
        return formatter
        }()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quote: UILabel!
    
    var note: Reminder? {
        didSet {
            if let note = note {
                self.titleLabel?.text = note.title
                var dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "EEEE, MMMM d, yyyy H:mm"
                self.dateLabel?.text = dateFormatter.stringFromDate(note.reminderdate)
                self.quote.text = note.quote
            }
        }
    }

}

