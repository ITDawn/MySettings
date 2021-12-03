//
//  SecurityViewController.swift
//  Settings
//
//  Created by Dany on 10.11.2021.
//

import UIKit

class SecurityViewController: UIViewController {
    let snitch: UISwitch = {
        let snitch = UISwitch()
        snitch.translatesAutoresizingMaskIntoConstraints = false
        return snitch
    }()
    
    let snitchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "Private mode"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let viewPrivate: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2971151471, green: 0.3021475077, blue: 0.3019965291, alpha: 0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.3490176499, green: 0.3479395211, blue: 0.3498669863, alpha: 0.863741503)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatarView: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.cornerRadius = 75
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "2")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.backgroundColor = .blue
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    let secondAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.cornerRadius = 75
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "3")
        avatar.backgroundColor = .blue
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    let secondUsername: UILabel = {
        let name = UILabel()
        name.text = "M****** J*****"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.textAlignment = .left
        name.font = UIFont.boldSystemFont(ofSize: 22)
        return name
    }()
    
    let userNamme: UILabel = {
        let name = UILabel()
        name.text = "Mikhael Jordan"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .black
        name.textAlignment = .left
        name.font = UIFont.boldSystemFont(ofSize: 22)
        return name
    }()
    
    let someView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(patternImage: UIImage(named: "default")!)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(patternImage: UIImage(named: "default")!)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let secondPrivateLabel: UILabel = {
        let label = UILabel()
        label.text = "Private mode ON"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelPrivate: UILabel = {
        let label = UILabel()
        label.text = "Private mode off"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(someView)
        self.view.backgroundColor = .black
        self.title = "Security settings"
        self.view.addSubview(viewPrivate)
        self.view.addSubview(secondView)
        
        secondView.addSubview(secondAvatar)
        secondView.addSubview(secondUsername)
        secondView.addSubview(secondPrivateLabel)
        viewPrivate.addSubview(snitch)
        viewPrivate.addSubview(snitchLabel)
        someView.addSubview(avatarView)
        someView.addSubview(userNamme)
        someView.addSubview(labelPrivate)
        animate()
        setUpViews()
        snitch.addTarget(self, action: #selector(security), for: .touchUpInside)
    }
    
    func animate() {
        UIView.animate(withDuration: 5, animations: {
            self.someView.alpha = 0.0
            self.secondView.alpha = 1
        }, completion: {done in
            if done{
                self.shrink()
            }
        })
    }
    
    func shrink() {
        UIView.animate(withDuration: 5, animations: {
            self.secondView.alpha = 0.0
            self.someView.alpha = 1
        }, completion: { done in
            if done{
                self.animate()
            }
        })
    }
    
    @objc func security() {
        
        if snitch.isOn == true {
            securityImage = UIImage(systemName: "lock.fill")
            let alert = UIAlertController(title: "Turn On private mode?", message: "in private mode, your profile data will be visible only to you", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancelAction)
            
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            
            alert.addAction(saveAction)
            
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Turn Off private mode?", message: "if you turn off private mode, everyone will be able to see your profile", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            
            alert.addAction(saveAction)
            
            self.present(alert, animated: true)
        }
        
    }
    
    func setUpViews() {
        let constraints = [
            
            secondUsername.topAnchor.constraint(equalTo: someView.topAnchor, constant: 50),
            secondUsername.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            secondAvatar.topAnchor.constraint(equalTo: secondUsername.bottomAnchor, constant: 10),
            secondAvatar.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            secondAvatar.heightAnchor.constraint(equalToConstant: 150),
            secondAvatar.widthAnchor.constraint(equalToConstant: 150),
            
            secondPrivateLabel.topAnchor.constraint(equalTo: secondAvatar.bottomAnchor, constant: 30),
            secondPrivateLabel.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            userNamme.topAnchor.constraint(equalTo: someView.topAnchor, constant: 50),
            userNamme.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            avatarView.topAnchor.constraint(equalTo: userNamme.bottomAnchor, constant: 10),
            avatarView.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: 150),
            avatarView.widthAnchor.constraint(equalToConstant: 150),
            
            labelPrivate.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            labelPrivate.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            
            secondView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            secondView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100),
            secondView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            secondView.heightAnchor.constraint(equalTo: someView.widthAnchor),
            
            someView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            someView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            someView.heightAnchor.constraint(equalTo: someView.widthAnchor),
            
            viewPrivate.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 100),
            viewPrivate.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -3),
            viewPrivate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 3),
            viewPrivate.heightAnchor.constraint(equalToConstant: 50),
            
            snitchLabel.leadingAnchor.constraint(equalTo: viewPrivate.leadingAnchor, constant: 10),
            snitchLabel.centerYAnchor.constraint(equalTo: viewPrivate.centerYAnchor),
            
            snitch.trailingAnchor.constraint(equalTo: viewPrivate.trailingAnchor, constant: -10),
            snitch.centerYAnchor.constraint(equalTo: viewPrivate.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
