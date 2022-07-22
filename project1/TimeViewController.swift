//
//  TimeViewController.swift
//  project1
//
//  Created by Sena Nur Sari on 3/19/22.
//
import UIKit

import Foundation


class TimeViewController: UIViewController {
    
    
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let dateInFormat = dateFormatter.string(from: myDate)
        timeLabel.text = dateInFormat
        liveLabel.text = TimeZone.current.identifier
        print(TimeZone.current.identifier)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let myDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let dateInFormat = dateFormatter.string(from: myDate)
        timeLabel.text = dateInFormat
        liveLabel.text = TimeZone.current.identifier
        
    }
    
    
}
