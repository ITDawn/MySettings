//
//  UsernameViewController.swift
//  Settings
//
//  Created by Dany on 05.11.2021.
//

import UIKit

class UsernameViewController: UIViewController {
    
    let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonForName: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let currentNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nameTextFiled: UITextField = {
        var textField = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.placeholder = "Enter username"
        textField.clearButtonMode = .always
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(someView)
        self.title = "Username"
        self.buttonForName.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.nameTextFiled.addTarget(self, action: #selector(statusChancged(textField:)), for: .editingChanged )
        self.view.backgroundColor = .white
        someView.addSubview(currentNameLabel)
        someView.addSubview(buttonForName)
        someView.addSubview(nameTextFiled)
        currentNameLabel.text = name
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.someView.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    func setUpViews() {
        let constraints = [
            currentNameLabel.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            currentNameLabel.centerYAnchor.constraint(equalTo: someView.centerYAnchor, constant: -300),
            
            nameTextFiled.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            nameTextFiled.centerYAnchor.constraint(equalTo: someView.centerYAnchor,constant: -100),
            nameTextFiled.heightAnchor.constraint(equalToConstant: 40),
            nameTextFiled.widthAnchor.constraint(equalToConstant: 200),
            
            buttonForName.topAnchor.constraint(equalTo: nameTextFiled.bottomAnchor, constant: 20),
            buttonForName.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            buttonForName.widthAnchor.constraint(equalToConstant: 170),
            
            someView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            someView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func buttonPressed() {
        currentNameLabel.text = name
        ViewController().nameLabel.text = name
        print("\(currentNameLabel.text ?? "Status clear")")
    }
    // прием текста из поля для текста
    @objc func statusChancged(textField: UITextField?) {
        name = textField?.text
    }
}
