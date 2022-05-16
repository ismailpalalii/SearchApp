//
//  SearchCollectionViewCell.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(frame: .zero)
    let typeLabel = UILabel(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(typeLabel)

        contentView.backgroundColor = UIColor.lightGray

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageView.backgroundColor = .darkGray
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = false;
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3.0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5.0).isActive = true
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3.0).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5.0).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5.0).isActive = true
        typeLabel.textAlignment = .left
        typeLabel.numberOfLines = 2
    
        layer.borderWidth = 2.0
        layer.borderColor = GlobalConstants.COLOR_BORDER_BLUE.cgColor
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setModelValues(with item: SearchCollectionCellViewModel) {
         imageView.sd_setImage(with: URL(string: item.artworkUrl100), placeholderImage: UIImage(named: "placeHolder.png"))
         titleLabel.attributedText = NSAttributedString(string: item.trackName, attributes: [.foregroundColor: UIColor.darkText, .font: UIFont.systemFont(ofSize: 8.0, weight: .medium)])
        typeLabel.attributedText = NSAttributedString(string: item.kind, attributes: [.foregroundColor: UIColor.darkText, .font: UIFont.systemFont(ofSize: 6.0, weight: .medium)])
     }
}
