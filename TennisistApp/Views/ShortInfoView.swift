//
//  ShortInfoView.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 01.05.2021.
//

import UIKit
import SwiftUI

class ShortInfoView: UIView {

    private let backgroundView = MainItemBackgroundView()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 124/255.0, green: 128/255.0, blue: 173/255.0, alpha: 1)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 124/255.0, green: 128/255.0, blue: 173/255.0, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    private let icon = UIImageView()
    
    private var isOnTheRightSide: Bool = false
    
    init(mainString: String, additionalString: String, infoString: String, iconImage: UIImage?, isOnTheRightSide: Bool = false) {
        super.init(frame: .zero)
        mainLabel.text = mainString
        additionalLabel.text = additionalString
        infoLabel.text = infoString
        icon.image = iconImage
        self.isOnTheRightSide = isOnTheRightSide
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        icon.tintColor = UIColor(red: 236/255.0, green: 99/255.0, blue: 48/255.0, alpha: 1)
        
        if isOnTheRightSide {
            backgroundView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        addSubview(backgroundView)
        addSubview(mainLabel)
        addSubview(additionalLabel)
        addSubview(infoLabel)
        addSubview(icon)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(18)
        }
        additionalLabel.snp.makeConstraints { make in
            make.left.equalTo(mainLabel.snp.right).offset(4)
            make.centerY.equalTo(mainLabel.snp.centerY)
        }
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(18)
            make.top.equalTo(mainLabel.snp.bottom).offset(4)
            make.right.equalToSuperview().inset(18)
        }
        icon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(19)
            make.left.greaterThanOrEqualTo(additionalLabel.snp.right).offset(4)
        }
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        backgroundView.setNeedsDisplay()
    }
}

