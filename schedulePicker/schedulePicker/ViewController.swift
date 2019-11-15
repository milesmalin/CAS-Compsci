//
//  ViewController.swift
//  schedulePicker
//
//  Created by Miles Malin on 10/23/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var curDayType = "A"
    var curWeekday = "Monday"
    var curSchedule = "Regular"
    
    let dayTypes:[String]=["A", "B", "C"]
    let weekdays:[String]=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let schedule:[String]=["Regular", "Double Period", "Assembly"]
    let mySchedule:[String:String] = [
        "A":"D and E",
        "B":"Comp sci",
        "C":"English",
        "D":"Spanish",
        "E":"Trig",
        "F":"US History",
        "G":"Free",
        "H":"Free"
    ]
    let myMonSchedule:[String:String] = [
    "A":"D and E",
    "B":"Comp sci",
    "C":"English",
    "D":"Spanish",
    "E":"Trig",
    "F":"US History",
    "G":"Life Skills",
    "H":"Life Skills"
    ]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
                  return dayTypes.count
              }
        else if component == 1 {
            return weekdays.count
        } else{
            return schedule.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayTypes[row]
        }
        else if component == 1{
            return weekdays[row]
        } else {
            return schedule[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            curDayType = dayTypes[row]
        }
        else if component == 1{
            curWeekday = weekdays[row]
        } else{
            curSchedule = schedule[row]
        }
    }
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = pickerView.selectedRow(inComponent: 0)
        let ACBDay = dayTypes[dayTypeRow]
        let nameOfDay = weekdays[pickerView.selectedRow(inComponent:1)]

        let periodRotation:[String:[String]] = [
            "A":["A", "B", "D", "E", "G", "H"],
            "C":["C", "A", "F", "D", "I", "G"],
            "B":["B", "C", "E", "F", "H", "I"]
            ]
        let MondayPeriod:[String:[String]] = [
        "A":["A", "B", "D", "E", "Monday", "Monday"],
        "C":["C", "A", "F", "D", "Monday", "Monday"],
        "B":["B", "C", "E", "F", "Monday", "Monday"]
        ]
        if nameOfDay == "Monday"{
            let mySched = getScheduleForDay(periods: MondayPeriod[ACBDay]!, mySchedule: mySchedule)
            label.text = mySched
        } else{
            let mySched = getScheduleForDay(periods: periodRotation[ACBDay]!, mySchedule: mySchedule)
            label.text = mySched
        }
       
    }
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "free period"
            output += "\n"
        }
        return output
    }
    
    


}

