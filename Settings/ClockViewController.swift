//
//  ClockViewController.swift
//  Settings
//
//  Created by Dany on 03.12.2021.
//

import UIKit
import FSCalendar

public class ClockViewController: UIViewController, FSCalendarDelegate {
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting: Bool = false
    
    let someView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START", for: .normal)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: .normal)
        return button
    }()
    
    let calendarView:FSCalendar = {
        let calendar = FSCalendar()
        calendar.backgroundColor = .white
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let clockLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = "Current date"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public  let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00 : 00"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Clock"
        self.view.addSubview(someView)
        someView.addSubview(clockLabel)
        someView.addSubview(dateLabel)
        someView.addSubview(calendarView)
        someView.addSubview(timerLabel)
        someView.addSubview(startButton)
        someView.addSubview(resetButton)
        startButton.addTarget(self, action: #selector(startStop(_:)), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTap(_:)), for: .touchUpInside)
        calendarView.delegate = self
        setUpViews()
    }
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE MM-dd-YYYY at h:mm a"
        let string = formater.string(from: date)
        print("\(string)")
    }
    
    func setUpViews() {
        let constraints = [
            someView.topAnchor.constraint(equalTo: self.view.topAnchor),
            someView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            someView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            someView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            clockLabel.topAnchor.constraint(equalTo: someView.safeAreaLayoutGuide.topAnchor, constant: 30),
            clockLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            clockLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: 10),
            clockLabel.heightAnchor.constraint(equalToConstant: 60),
            
            dateLabel.topAnchor.constraint(equalTo: clockLabel.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 60),
            
            timerLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 100),
            timerLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            timerLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: 10),
            timerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            startButton.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 10),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 20),
            
            resetButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            resetButton.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10),
            resetButton.widthAnchor.constraint(equalToConstant: 200),
            resetButton.heightAnchor.constraint(equalToConstant: 20),
            
            calendarView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50),
            calendarView.leadingAnchor.constraint(equalTo: someView.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: someView.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: someView.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.someView.backgroundColor = UIColor(patternImage: backgroundImage!)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let date = Date()
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "hh:mm:ss a"
            let currentTime = dateFormater.string(from: date)
            self.clockLabel.text = currentTime
            dateFormater.dateFormat = "dd.MM.yyyy"
            let currentDate = dateFormater.string(from: date)
            self.dateLabel.text = currentDate
        }
        
        func resetTap(_ sender: Any) {
            let alert = UIAlertController(title: "Reset timer?", message: "Are you shure you whould like to reset timer?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {(_) in
                
            }))
            alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(_) in
                self.count = 0
                self.timer.invalidate()
                self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
                self.startButton.setTitle("START", for: .normal)
                self.startButton.setTitleColor(UIColor.systemGreen, for: .normal)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        func startStop(_ sednder: Any) {
            if(timerCounting){
                timerCounting = false
                timer.invalidate()
                startButton.setTitle("START", for: .normal)
                startButton.setTitleColor(UIColor.systemGreen, for: .normal)
                
            } else {
                timerCounting = true
                startButton.setTitle("STOP", for: .normal)
                startButton.setTitleColor(UIColor.systemRed, for: .normal)
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            }
        }
        
        
    }
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timString = makeTimeString(hours: time.1, minutes: time.1, seconds: time.2)
        timerLabel.text = timString
    }
    @objc func startStop(_ sednder: Any) {
        if(timerCounting){
            timerCounting = false
            timer.invalidate()
            startButton.setTitle("START", for: .normal)
            startButton.setTitleColor(UIColor.systemGreen, for: .normal)
            
        } else {
            timerCounting = true
            startButton.setTitle("STOP", for: .normal)
            startButton.setTitleColor(UIColor.systemRed, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    @objc func resetTap(_ sender: Any) {
        let alert = UIAlertController(title: "Reset timer?", message: "Are you shure you whould like to reset timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {(_) in
            
        }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {(_) in
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startButton.setTitle("START", for: .normal)
            self.startButton.setTitleColor(UIColor.systemGreen, for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    func makeTimeString(hours: Int, minutes: Int, seconds: Int ) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}
