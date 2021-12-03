//
//  AvatarViewController.swift
//  Settings
//
//  Created by Dany on 08.11.2021.
//

import UIKit

class AvatarViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    public var avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 150
        avatar.layer.borderWidth = 5
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .white
        return avatar
    }()
    
    let avatarLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Avatar"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let photoPickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pick a photo", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let someView:UIView = {
        let scroll = UIView()
        scroll.backgroundColor = .black
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(someView)
        self.view.addSubview(photoPickButton)
        self.view.addSubview(avatarLabel)
        self.view.addSubview(avatarImage)
        self.title = "Avatar change"
        self.view.backgroundColor = .white
        self.photoPickButton.addTarget(self, action: #selector(pickPhotoTap), for: .touchUpInside)
        self.setUpViews()
        self.avatarImage.image = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.someView.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    func setUpViews() {
        let constraints = [
            avatarImage.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 20),
            avatarImage.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: 300),
            avatarImage.heightAnchor.constraint(equalToConstant: 300),
            
            avatarLabel.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            avatarLabel.topAnchor.constraint(equalTo: someView.topAnchor, constant: 40),
            
            photoPickButton.centerXAnchor.constraint(equalTo: someView.centerXAnchor),
            photoPickButton.widthAnchor.constraint(equalToConstant: 170),
            photoPickButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            
            someView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            someView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            someView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func pickPhotoTap() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.isEditing = true
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage
        dismiss(animated: true, completion: nil)
        self.avatarImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
