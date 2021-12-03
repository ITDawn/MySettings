//
//  LanguageViewController.swift
//  Settings
//
//  Created by Dany on 30.11.2021.
//

import UIKit

public class LanguageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let languages = ["English", "Español", "日本語"]
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let language = languages[row]
        return language
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedLanguage = languages[row]
        print(pickedLanguage!)
    }
    
    let someView: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(someView)
        self.view.backgroundColor = .systemGray5
        someView.delegate = self
        someView.dataSource = self
        setupViews()
    }
    func setupViews() {
        let constraints = [
            someView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
            someView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
