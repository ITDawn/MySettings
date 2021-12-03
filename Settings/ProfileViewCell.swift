//
//  ProfileViewCell.swift
//  Settings
//
//  Created by Dany on 29.11.2021.
//

import UIKit

class ProfileViewCell: UITableViewCell {

    let identifier = "cellId"
        var settings: Settings? {
             
             didSet {
                 
                titleLabel.text = settings?.label
                iconImage.image = settings?.image
               
             }
         }
        
       
        var titleLabel:UILabel = {
            let label = UILabel()
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        let iconImage: UIImageView = {
            let image = UIImageView()
            image.layer.cornerRadius = 5
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleToFill
            image.clipsToBounds = true
            image.backgroundColor = .white
            return image
        }()
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super .init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            super .init(coder: coder)
            setupViews()
        }
        
    }



    extension ProfileViewCell {
        private func setupViews(){
            
            contentView.addSubview(titleLabel)
            contentView.addSubview(iconImage)
           

            let constraints = [
             
                iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
                iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImage.heightAnchor.constraint(equalToConstant: 30),
                iconImage.widthAnchor.constraint(equalTo: iconImage.heightAnchor),
                
                titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20),
                titleLabel.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor)
               

            ]

            NSLayoutConstraint.activate(constraints)
        }
    }


