//
//  ViewController.swift
//  Settings
//
//  Created by Dany on 04.11.2021.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    let map = LocationViewController()
    let imageAvatar = AvatarViewController()
    
    let flightMode: UIImageView = {
        let flightImage = UIImageView()
        flightImage.backgroundColor = .none
        flightImage.translatesAutoresizingMaskIntoConstraints = false
        return flightImage
    }()
    
    let securityMode: UIImageView = {
        let securityImage = UIImageView()
        securityImage.backgroundColor = .none
        securityImage.translatesAutoresizingMaskIntoConstraints = false
        return securityImage
    }()
    
    let notificationsMode: UIImageView = {
        let notificationsImage = UIImageView()
        notificationsImage.backgroundColor = .none
        notificationsImage.translatesAutoresizingMaskIntoConstraints = false
        return notificationsImage
    }()
    
    let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.imageView?.tintColor = .systemGray
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        return button
    }()
    
    public let myLocationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(someView)
        self.settingsButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.title = "Settings"
        self.view.backgroundColor = .white
        someView.addSubview(flightMode)
        someView.addSubview(securityMode)
        someView.addSubview(notificationsMode)
        someView.addSubview(nameLabel)
        someView.addSubview(settingsButton)
        someView.addSubview(imageAvatar.avatarImage)
        someView.addSubview(myLocationLabel)
        imageAvatar.avatarImage.layer.cornerRadius = 100
        setUpViews()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = name
        imageAvatar.avatarImage.image = image
        flightMode.image = flight
        securityMode.image = securityImage
        notificationsMode.image = notificationsImage
        map.currentLocation.isHidden = hiden ?? true
        self.someView.backgroundColor = UIColor(patternImage: backgroundImage!)
        myLocationLabel.text = locationText
        
        
    }
    func setUpViews() {
        let constraints = [
            myLocationLabel.topAnchor.constraint(equalTo: imageAvatar.avatarImage.bottomAnchor, constant: 20),
            myLocationLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            myLocationLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            myLocationLabel.heightAnchor.constraint(equalToConstant: 60),
            
            flightMode.topAnchor.constraint(equalTo: someView.topAnchor, constant: 5),
            flightMode.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 5),
            
            securityMode.topAnchor.constraint(equalTo: someView.topAnchor, constant: 5),
            securityMode.leadingAnchor.constraint(equalTo: flightMode.trailingAnchor, constant: 5),
            
            notificationsMode.topAnchor.constraint(equalTo: someView.topAnchor, constant: 5),
            notificationsMode.leadingAnchor.constraint(equalTo: securityMode.trailingAnchor, constant: 5),
            
            imageAvatar.avatarImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            imageAvatar.avatarImage.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            imageAvatar.avatarImage.widthAnchor.constraint(equalToConstant: 200),
            imageAvatar.avatarImage.heightAnchor.constraint(equalToConstant: 200),
            
            nameLabel.topAnchor.constraint(equalTo: someView.topAnchor, constant: 100),
            nameLabel.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            settingsButton.topAnchor.constraint(equalTo: someView.topAnchor, constant: 10),
            settingsButton.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -10),
            
            someView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            someView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    @objc func buttonPressed() {
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

