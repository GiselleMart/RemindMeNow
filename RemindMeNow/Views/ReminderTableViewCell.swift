//
//  NoteTableViewCell.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/20/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import Foundation
import UIKit

class NoteTableViewCell: UITableViewCell {
    
    // initialize the date formatter only once, using a static computed property
    static var dateFormatter: NSDateFormatter = {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return formatter
        }()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var note: Note? {
        didSet {
            if let note = note, titleLabel = titleLabel, dateLabel = dateLabel {
                self.titleLabel.text = note.title
                self.dateLabel.text = NoteTableViewCell.dateFormatter.stringFromDate(note.modificationDate)
            }
        }
    }
    
}
