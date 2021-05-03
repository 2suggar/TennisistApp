//
//  RatingView.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 02.05.2021.
//

import UIKit

class RatingView: UIView {

    private let backgroundView = MainItemBackgroundView()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        
        label.text = "38"
        
        return label
    }()
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 124/255.0, green: 128/255.0, blue: 173/255.0, alpha: 1)
        
        label.text = "Оценок"
        
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 124/255.0, green: 128/255.0, blue: 173/255.0, alpha: 1)
        
        label.text = "Рейтинг"
        
        return label
    }()
    
    private let icon = UIImageView(image: UIImage(named: "rating"))
    
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 7
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        icon.tintColor = UIColor(red: 236/255.0, green: 99/255.0, blue: 48/255.0, alpha: 1)
        
        setupStackView(with: 6)
        
        addSubview(backgroundView)
        addSubview(mainLabel)
        addSubview(additionalLabel)
        addSubview(infoLabel)
        addSubview(icon)
        addSubview(starsStackView)
        
        setupConstraints()
    }
    
    private func setupStackView(with starsCount: Int) {
        for _ in 1...starsCount {
            let star = UIImageView(image: UIImage(named: "star"))
            starsStackView.addArrangedSubview(star)
        }
    }
    
    private func setupConstraints() {
        icon.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(18)
            make.height.equalTo(19)
        }
        mainLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.top.equalTo(icon.snp.bottom).offset(18)
        }
        additionalLabel.snp.makeConstraints { make in
            make.left.equalTo(mainLabel.snp.right).offset(4)
            make.centerY.equalTo(mainLabel.snp.centerY)
            make.right.lessThanOrEqualToSuperview().inset(18)
        }
        starsStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.top.equalTo(mainLabel.snp.bottom).offset(18)
            make.right.lessThanOrEqualToSuperview().inset(18)
        }
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(18)
            make.top.equalTo(starsStackView.snp.bottom).offset(18)
            make.right.lessThanOrEqualToSuperview().inset(18)
        }
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        backgroundView.setNeedsDisplay()
    }

}
