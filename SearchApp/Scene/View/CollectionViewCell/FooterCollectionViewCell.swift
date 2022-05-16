//
//  FooterCollectionViewCell.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import UIKit

class FooterCollectionViewCell: UICollectionReusableView {
    let activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false

        activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
