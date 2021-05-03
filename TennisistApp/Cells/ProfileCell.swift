//
//  ProfileCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        
        label.text = "Василий Козлов"
        
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        
        label.text = "Россия, Москва"
        
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .center
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(infoLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(locationLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
