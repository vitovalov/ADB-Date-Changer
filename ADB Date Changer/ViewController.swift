//
//  ViewController.swift
//  ADB Date Changer
//
//  Created by Vitaliy Konovalov on 4/6/16.
//  Copyright © 2016 Vitovalov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var calendar: NSDatePickerCell!
    
    @IBAction func calendarPicked(sender: AnyObject) {
        
        print(calendar.dateValue.description)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd.HHmmss"
        let formattedDate = dateFormatter.stringFromDate(calendar.dateValue)
        
        let resourcesUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("adb", ofType: "")!).URLByStandardizingPath
        let resourcesPath = resourcesUrl?.path
        
        let jaf = "'"+resourcesPath! + "'"
        let dos = jaf + " -e shell \'su 0 date -s "+formattedDate + "\'"
        
        print(dos)
        
        let output = dos.runAsCommand()
        
        print(output)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


extension String {
    func runAsCommand() -> String {
        let pipe = NSPipe()
        let task = NSTask()
        task.launchPath = "/bin/sh"
        task.arguments = ["-c", String(format:"%@", self)]
        task.standardOutput = pipe
        let file = pipe.fileHandleForReading
        task.launch()
        if let result = NSString(data: file.readDataToEndOfFile(), encoding: NSUTF8StringEncoding) {
            return result as String
        }
        else {return "--- Unable to initialize string from file data ---"}
    }
}
