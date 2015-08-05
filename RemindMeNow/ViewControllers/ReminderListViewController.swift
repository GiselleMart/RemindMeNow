//
//  ReminderListViewController.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/22/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import FontAwesomeKit

class ReminderListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: SBGestureTableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var prototypeCell : ReminderTableViewCell?
    enum State {
        case DefaultMode
        case SearchMode
    }
    
    var state: State = .DefaultMode
    
    var selectedNote:Reminder?
    
    var reminders: Results<Reminder>! {
        didSet {
            //tableView.reloadData()
        }
    }
    
    // Swipe table view variables
//    let checkIcon = FAKIonIcons
    let checkIcon = FAKIonIcons.iosCheckmarkIconWithSize(30)
    let closeIcon = FAKIonIcons.iosCloseIconWithSize(30)
    let composeIcon = FAKIonIcons.iosComposeIconWithSize(30)
    let clockIcon = FAKIonIcons.iosClockIconWithSize(30)
    let greenColor = UIColor(red: 85.0/255, green: 213.0/255, blue: 80.0/255, alpha: 1)
    let redColor = UIColor(red: 213.0/255, green: 70.0/255, blue: 70.0/255, alpha: 1)
    let yellowColor = UIColor(red: 236.0/255, green: 223.0/255, blue: 60.0/255, alpha: 1)
    let brownColor = UIColor(red: 182.0/255, green: 127.0/255, blue: 78.0/255, alpha: 1)
    
    var removeCellBlock: ((SBGestureTableView, SBGestureTableViewCell) -> Void)!
    
    func setupIcons() {
        checkIcon.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
        closeIcon.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor())
    }
    
    override func viewDidLoad() {
        
        let realm = Realm()
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 129
        prototypeCell = tableView.dequeueReusableCellWithIdentifier("reminderCell") as? ReminderTableViewCell
        reminders = realm.objects(Reminder).sorted("reminderdate", ascending: false)
        
        removeCellBlock = {(tableView: SBGestureTableView, cell: SBGestureTableViewCell) -> Void in
            let indexPath = tableView.indexPathForCell(cell)
            
            // setting variable reminder to be the reminder at indexpath.row and casting it as a remin3der OBJECT.
            let reminder = self.reminders[indexPath!.row] as Reminder
            
            //self.objects.removeObjectAtIndex(indexPath!.row)
            tableView.removeCell(cell, duration: 0.3, completion: nil)
            
            realm.write() {
                realm.delete(reminder)
            }
            
            println("cell is deleted")
        }
        
       

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
       println(segue.identifier)
        if let identifier = segue.identifier { let realm = Realm()
            switch identifier {
            case "Save":
            
                let source = segue.sourceViewController as! ReminderDetailViewController //1
                
            
            case "Delete":
                realm.write() {
                    realm.delete(self.selectedNote!)
                }
                
                let source = segue.sourceViewController as! ReminderDetailViewController
                source.reminder = nil;
                
            default:
                println("Life is good \(identifier)")
            }
            
            reminders = realm.objects(Reminder).sorted("reminderdate", ascending: false) //2
        }
    }
    
    //MARK:UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reminderCell", forIndexPath: indexPath) as! ReminderTableViewCell
        
        let aReminder = reminders[indexPath.row]

        let size = CGSizeMake(30, 30)
        cell.firstLeftAction = SBGestureTableViewCellAction(icon: checkIcon.imageWithSize(size), color: greenColor, fraction: 0.3, didTriggerBlock: removeCellBlock)
        
        cell.firstRightAction = SBGestureTableViewCellAction(icon: composeIcon.imageWithSize(size), color: yellowColor, fraction: 0.3, didTriggerBlock: removeCellBlock)
        cell.note = aReminder

    

        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let cell = prototypeCell {
            let aReminder = reminders[indexPath.row]
            cell.note = aReminder
            cell.layoutIfNeeded()
            let size = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            return size.height+1
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
extension ReminderListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedNote = reminders[indexPath.row]      //1
        self.performSegueWithIdentifier("ShowExistingNote", sender: self)     //2
    }

    // 3
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func searchReminders(searchString: String) -> Results<Reminder> {
        let realm = Realm()
        let searchPredicate = NSPredicate(format: "title CONTAINS[c] %@ OR content CONTAINS[c] %@", searchString, searchString)

        return realm.objects(Reminder).filter(searchPredicate)
    }
    // 4
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let note = reminders[indexPath.row] as Object
            
            let realm = Realm()
            
            realm.write() {
                realm.delete(note)
            }
            
            reminders = realm.objects(Reminder).sorted("reminderdate", ascending: false)
        }
    }
    
}

extension ReminderListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        state = .SearchMode
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        state = .DefaultMode
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        reminders = searchReminders(searchText)
    }

}





    



