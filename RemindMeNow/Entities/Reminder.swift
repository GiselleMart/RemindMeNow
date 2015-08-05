//
//  Reminder.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/24/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import Foundation
import UIKit
import Realm
import RealmSwift

class Reminder: Object {
    dynamic var title: String = ""
    dynamic var content: String = ""
    dynamic var reminderdate = NSDate()
    dynamic var quote: String = ""
    }

