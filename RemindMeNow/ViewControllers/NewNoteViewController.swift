//
//  NewNoteViewController.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/20/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    var currentNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                if (segue.identifier == "ShowNewNote") {
        
            currentNote = Note()
            let noteViewController = segue.destinationViewController as! NoteDisplayViewController
            noteViewController.note = currentNote
            noteViewController.edit = true
        }
    }
    
}
