//
//  CustomHeaderView.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 30.04.2021.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    var headerString: String? {
        didSet {
            nameLabel.text = headerString
        }
    }
    
    var additionalString: String? {
        didSet {
            infoLabel.text = additionalString
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor(red: 166/255.0, green: 254/255.0, blue: 5/255.0, alpha: 1)
        
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        tintColor = .clear
        
        addSubview(nameLabel)
        addSubview(infoLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().inset(4)
        }
        infoLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.centerY.equalToSuperview()
            make.left.greaterThanOrEqualTo(nameLabel.snp.right).offset(16)
        }
    }
}
