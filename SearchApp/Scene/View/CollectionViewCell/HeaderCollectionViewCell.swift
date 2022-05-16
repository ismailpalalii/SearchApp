//
//  HeaderCollectionViewCell.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import UIKit

class HeaderCollectionViewCell: UICollectionReusableView {
     
    let titleLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.darkGray
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
