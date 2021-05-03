//
//  SeparatorCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 02.05.2021.
//

import UIKit

class SeparatorCell: UITableViewCell {

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 30/255.0, green: 30/255.0, blue: 38/255.0, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        contentView.addSubview(separatorView)
        backgroundColor = .clear
        setupConstraints()
    }
    
    private func setupConstraints() {
        separatorView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.right.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.scale)
        }
    }

}
