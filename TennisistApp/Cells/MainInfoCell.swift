//
//  MainInfoCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 30.04.2021.
//

import UIKit
import SnapKit

class MainInfoCell: UITableViewCell {
    
    private let ratingView = RatingView()
    
    private let ageView = ShortInfoView(mainString: "38", additionalString: "", infoString: "Лет", iconImage: UIImage(named: "bday"), isOnTheRightSide: true)
    
    private let genderView = ShortInfoView(mainString: "Мужской", additionalString: "", infoString: "Пол", iconImage: UIImage(named: "gender"), isOnTheRightSide: true)
    
    private let heightView = ShortInfoView(mainString: "180", additionalString: "См", infoString: "Рост", iconImage: UIImage(named: "height"))
    
    private let armView = ShortInfoView(mainString: "Правая", additionalString: "", infoString: "Преобладающая рука", iconImage: UIImage(named: "arm"), isOnTheRightSide: true)
    
    private lazy var ageAndGenderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(ageView)
        stackView.addArrangedSubview(genderView)
        stackView.spacing = 9
        return stackView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(ratingView)
        stackView.addArrangedSubview(ageAndGenderStackView)
        stackView.spacing = 9
        return stackView
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(heightView)
        stackView.addArrangedSubview(armView)
        stackView.spacing = 9
        return stackView
    }()
    
    private lazy var finalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(topStackView)
        stackView.addArrangedSubview(bottomStackView)
        stackView.spacing = 9
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        addSubview(finalStackView)
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        finalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(18)
        }
    }

}
