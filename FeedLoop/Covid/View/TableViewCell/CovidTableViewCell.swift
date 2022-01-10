//
//  CovidTableViewCell.swift
//  FeedLoop
//
//  Created by Miftah Juanda Batubara on 10/01/22.
//

import UIKit

class CovidTableViewCell: UITableViewCell {
    static var idCell: String = "CovidTableViewCell"
    
    
    var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Country"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    var confirmedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirmed"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    var deathLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Death"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    var recovLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recovery"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    var activemedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Active"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(countryLabel)
        contentView.addSubview(confirmedLabel)
        contentView.addSubview(deathLabel)
        contentView.addSubview(recovLabel)
        contentView.addSubview(activemedLabel)
        
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            confirmedLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor,constant: 5),
            confirmedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            confirmedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            deathLabel.topAnchor.constraint(equalTo: confirmedLabel.bottomAnchor,constant: 5),
            deathLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            deathLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            recovLabel.topAnchor.constraint(equalTo: deathLabel.bottomAnchor,constant: 5),
            recovLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recovLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            activemedLabel.topAnchor.constraint(equalTo: recovLabel.bottomAnchor,constant: 5),
            activemedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            activemedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            activemedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
