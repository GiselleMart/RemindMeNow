//
//  Note.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/20/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import Foundation
import RealmSwift

class Note : Object {
    dynamic var title: String = ""
    dynamic var content: String = ""
    dynamic var modificationDate = NSDate()
}