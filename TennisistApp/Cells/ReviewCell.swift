//
//  ReviewCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Vasilii")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        
        label.text = "Василий Козлов"
        
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 236/255.0, green: 99/255.0, blue: 48/255.0, alpha: 1)
        
        label.text = "5 *"
        
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.textColor = .white
        
        label.text = "Крутой тренер с сильной правой рукой а может левой"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(infoLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        avatarImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.size.equalTo(32)
            make.top.equalToSuperview().offset(46)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImageView.snp.right).offset(6)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(avatarImageView.snp.top).offset(-4)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.left)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(ratingLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(29)
        }
    }

}
