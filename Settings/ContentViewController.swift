//
//  ContentViewController.swift
//  Settings
//
//  Created by Dany on 25.11.2021.
//

import UIKit

class ContentViewController: UIViewController {
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Set background style"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelOne: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelThree: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let someView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let variantOne: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(patternImage: UIImage(named: "12")!)
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let variantTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(patternImage: UIImage(named: "13")!)
        
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let variantThree: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(patternImage: UIImage(named: "14")!)
        
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLayoutSubviews() {
        setUpViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.title = "Content Mode"
        self.view.addSubview(topLabel)
        self.view.addSubview(someView)
        self.view.addSubview(variantOne)
        self.view.addSubview(variantTwo)
        self.view.addSubview(variantThree)
        self.view.addSubview(bottomLabel)
        self.view.addSubview(labelOne)
        self.view.addSubview(labelTwo)
        self.view.addSubview(labelThree)
        gestureFirst = UITapGestureRecognizer(target: self, action: #selector(variantOneTapped(_:)))
        gestureFirst.numberOfTapsRequired = 1
        gestureFirst.numberOfTouchesRequired = 1
        variantOne.addGestureRecognizer(gestureFirst)
        variantOne.isUserInteractionEnabled = true
        gestureSecond = UITapGestureRecognizer(target: self, action: #selector(variantTwoTapped(_:)))
        gestureSecond.numberOfTapsRequired = 1
        gestureSecond.numberOfTouchesRequired = 1
        variantTwo.addGestureRecognizer(gestureSecond)
        variantTwo.isUserInteractionEnabled = true
        gestureThird = UITapGestureRecognizer(target: self, action: #selector(variantThreeTapped(_:)))
        gestureThird.numberOfTapsRequired = 1
        gestureThird.numberOfTouchesRequired = 1
        variantThree.addGestureRecognizer(gestureThird)
        variantThree.isUserInteractionEnabled = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        
    }
    
    func setUpViews() {
        
        let constraints = [
            topLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            topLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            topLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            topLabel.heightAnchor.constraint(equalToConstant: 50),
            
            someView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            someView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            someView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
            someView.heightAnchor.constraint(equalToConstant: 400),
            
            variantOne.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 40),
            variantOne.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            variantOne.widthAnchor.constraint(equalToConstant: 108),
            variantOne.heightAnchor.constraint(equalToConstant: 170),
            
            variantTwo.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 40),
            variantTwo.leadingAnchor.constraint(equalTo: variantOne.trailingAnchor, constant: 13),
            variantTwo.widthAnchor.constraint(equalToConstant: 108),
            variantTwo.heightAnchor.constraint(equalToConstant: 170),
            
            variantThree.topAnchor.constraint(equalTo: someView.bottomAnchor, constant: 40),
            variantThree.leadingAnchor.constraint(equalTo: variantTwo.trailingAnchor, constant: 13),
            variantThree.widthAnchor.constraint(equalToConstant: 108),
            variantThree.heightAnchor.constraint(equalToConstant: 170),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    var gestureFirst = UITapGestureRecognizer()
    var gestureSecond = UITapGestureRecognizer()
    var gestureThird = UITapGestureRecognizer()
    
    @objc func variantOneTapped(_ sender: UITapGestureRecognizer) {
        if self.variantOne.layer.borderColor == UIColor.white.cgColor && self.variantTwo.layer.borderColor == UIColor.blue.cgColor || self.variantThree.layer.borderColor == UIColor.blue.cgColor{
            self.variantOne.layer.borderColor = UIColor.blue.cgColor
            self.variantThree.layer.borderColor = UIColor.white.cgColor
            self.variantTwo.layer.borderColor = UIColor.white.cgColor
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "12")!)
            backgroundImage = UIImage(named: "9")
            cellImage = UIImage(named: "1st")
            labelColor = #colorLiteral(red: 0.329885751, green: 0.3556993604, blue: 0.3913913965, alpha: 1)
        } else {
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "12")!)
            self.variantOne.layer.borderColor = UIColor.blue.cgColor
            backgroundImage = UIImage(named: "9")
            cellImage = UIImage(named: "1st")
            labelColor = #colorLiteral(red: 0.329885751, green: 0.3556993604, blue: 0.3913913965, alpha: 1)
        }
    }
    
    @objc func variantTwoTapped(_ sender: UITapGestureRecognizer) {
        if self.variantTwo.layer.borderColor == UIColor.white.cgColor && self.variantOne.layer.borderColor == UIColor.blue.cgColor || self.variantThree.layer.borderColor == UIColor.blue.cgColor {
            self.variantTwo.layer.borderColor = UIColor.blue.cgColor
            self.variantOne.layer.borderColor = UIColor.white.cgColor
            self.variantThree.layer.borderColor = UIColor.white.cgColor
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "11")!)
            backgroundImage = UIImage(named: "11")
            cellImage = UIImage(named: "2nd")
        } else {
            self.variantTwo.layer.borderColor = UIColor.blue.cgColor
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "11")!)
            backgroundImage = UIImage(named: "11")
            cellImage = UIImage(named: "2nd")
        }
    }
    
    @objc func variantThreeTapped(_ sender: UITapGestureRecognizer) {
        if self.variantThree.layer.borderColor == UIColor.white.cgColor && self.variantTwo.layer.borderColor == UIColor.blue.cgColor || self.variantOne.layer.borderColor == UIColor.blue.cgColor{
            self.variantThree.layer.borderColor = UIColor.blue.cgColor
            self.variantOne.layer.borderColor = UIColor.white.cgColor
            self.variantTwo.layer.borderColor = UIColor.white.cgColor
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "15")!)
            backgroundImage = UIImage(named: "15")
            cellImage = UIImage(named: "3rd")
        } else {
            self.variantThree.layer.borderColor = UIColor.blue.cgColor
            self.someView.backgroundColor = UIColor.init(patternImage: UIImage(named: "15")!)
            backgroundImage = UIImage(named: "15")
            cellImage = UIImage(named: "3rd")
        }
    }
}
