//
//  SettingsViewController.swift
//  Settings
//
//  Created by Dany on 04.11.2021.
//

import UIKit
import UserNotifications

class SettingsViewController: UIViewController {
    let engStorage = englishStorage.tableModel
    let japStorage = japanStorage.tableModel
    let espStorage = espanolStorage.tableModel
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .black
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    var cellIm: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.title = "Settings"
        tableView.separatorColor = .gray
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell().identifier)
        setUpViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.backgroundColor = UIColor(patternImage: backgroundImage!)
        tableView.reloadData()
    }
    
    func setUpViews() {
        tableView.delegate = self
        tableView.dataSource = self
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
extension SettingsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return engStorage[0].settings.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let avatarVC = AvatarViewController()
        let securityVC = SecurityViewController()
        if indexPath.row == 6 {
            let defaultURL = NSURL(string: "https://support.apple.com/ru-ru")!
            UIApplication.shared.openURL(defaultURL as URL)
        }
        let locationVC = LocationViewController()
        let contentVC = ContentViewController()
        let vc = UsernameViewController()
        let languageVC = LanguageViewController()
        let clockVc = ClockViewController()
        
        vc.title = "Change Username"
        
        if indexPath.row == 1 {
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.row == 2 {
            self.navigationController?.pushViewController(avatarVC, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }else if indexPath.row == 9 {
            self.navigationController?.pushViewController(securityVC, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.row == 7 {
            self.navigationController?.pushViewController(locationVC, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.row == 3 {
            self.navigationController?.pushViewController(contentVC, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.row == 8 {
            self.navigationController?.pushViewController(languageVC, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.row == 5 {
            self.navigationController?.pushViewController(clockVc, animated: true)
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell().identifier, for: indexPath) as! TableViewCell
        cell.titleLabel.textColor = labelColor
        cell.backgroundColor = UIColor(patternImage: cellImage!)
        if pickedLanguage == "Español" {
            cell.settings = espStorage[0].settings[indexPath.row]
        }else if pickedLanguage == "日本語" {
            cell.settings = japStorage[0].settings[indexPath.row]
        } else {
            cell.settings = engStorage[0].settings[indexPath.row]
        }
        if indexPath.row == 0 || indexPath.row == 4 {
            cell.snitch.isHidden = false
        }
        if indexPath.row == 0 {
            cell.snitch.addTarget(self, action: #selector(flightMode), for: .touchUpInside)
        }
        
        if indexPath.row == 4 {
            cell.snitch.addTarget(self, action: #selector(notificationTap), for: .touchUpInside)
            cell.snitch.addTarget(self, action: #selector(notifications), for: .touchUpInside)
        }
        cell.separatorInset.left = 60
        
        return cell
    }
    @objc func notificationTap() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        let content = UNMutableNotificationContent()
        content.title = "Notifications is on"
        content.body = "To switch off notifications follow to settings"
        
        let date = Date().addingTimeInterval(1)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        center.add(request) { (error) in
            
        }
    }
    @objc func flightMode() {
        flight = UIImage(systemName: "airplane")
    }
    @objc func notifications() {
        notificationsImage = UIImage(systemName: "bell.fill")
    }
    
    
}
