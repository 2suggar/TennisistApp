//
//  StudentCollectionViewCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 57 / 2
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Vasilii")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        
        label.text = "Василий"
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        avatarImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(13)
            make.size.equalTo(57)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(13)
            make.left.right.equalToSuperview().inset(13)
            make.bottom.equalToSuperview().inset(13)
        }
    }
}
