//
//  ViewController.swift
//  Calendar
//
//  Created by 10.12 on 2018/11/27.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var textField: UITextField!
    @IBOutlet var eventCalenderio: UITextField!
    @IBOutlet var titleEvent: UITextField!
    
    @objc var eventStore: EKEventStore!
    @objc var calendar: EKCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventStore = EKEventStore()
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyBoard))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func saveCalendar(_ sender: UIButton) {
        let calendar = EKCalendar(for: EKEntityType.event, eventStore: eventStore)
        eventStore.requestAccess(to: EKEntityType.event, completion: {(granted, error) in
            if granted == false {
                print("Access Denied")
            } else {
                var auxiliar = self.eventStore.sources
                calendar.source = auxiliar[0]
                calendar.title = self.textField.text!
                print(calendar.title)
                
                try! self.eventStore.saveCalendar(calendar, commit: true)
            }
        })
    }
    
    @IBAction func saveEvent(_ sender: Any) {
        eventStore.requestAccess(to: EKEntityType.event, completion: {(granted, error) in
            if granted == false {
                print("Access Denied")
            } else {
                let arrayCalendars = self.eventStore.calendars(for: EKEntityType.event)
                var theCalendar: EKCalendar!
                for calendario in arrayCalendars {
                    if calendario.title == self.eventCalenderio.text {
                        theCalendar = calendario
                        print(theCalendar.title)
                    }
                }
                if(theCalendar != nil){
                    let event = EKEvent(eventStore: self.eventStore)
                    event.title = self.titleEvent.text!
                    event.startDate = self.datePicker.date
                    event.endDate = self.datePicker.date.addingTimeInterval(3600)
                    event.calendar = theCalendar
                    do {
                        try! self.eventStore.save(event, span: .thisEvent)
                        let alert = UIAlertController(title: "Calendar", message: "Event created \(String(describing: event.title)) in \(theCalendar.title)", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertAction.Style.default, handler: nil))
                        DispatchQueue.main.async(execute: { () -> Void in
                            self.present(alert, animated: true, completion: nil)
                        })
                    }
                }
                else{
                    print("No calendar with that name")
                }
                
            }
        })
        
        
        
    }

    
    @objc func dismissKeyBoard() {
        self.textField.resignFirstResponder()
    }
    
    // Called when "return" key pressed. return "NO" to ignore
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Called when users tap out of textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

