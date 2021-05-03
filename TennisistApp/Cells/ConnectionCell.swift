//
//  ConnectionCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 30.04.2021.
//

import UIKit
import SnapKit

private enum Const {
    static let radius: CGFloat = 17
    static let itemViewHeight: CGFloat = 53
    
    static let spacing: CGFloat = 16
}

class ConnectionCell: UITableViewCell {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = Const.spacing
        return stackView
    }()
    
    private let background: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 23
        view.backgroundColor = UIColor(red: 30/255.0, green: 30/255.0, blue: 38/255.0, alpha: 1)
        return view
    }()
    
    private lazy var addFriendView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Const.radius
        view.backgroundColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 67/255.0, alpha: 1)
        
        let icon = UIImageView(image: UIImage(named: "addFriendIcon"))
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.width.equalTo(51)
        }
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addFriendTapped)))
        
        return view
    }()
    
    private lazy var itemViewBuilder: ((String) -> UIView) = { name -> UIView in
        let label = UILabel()
        label.text = name
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        
        let view = UIView()
        view.layer.cornerRadius = Const.radius
        view.backgroundColor = UIColor(red: 39/255.0, green: 176/255.0, blue: 196/255.0, alpha: 1)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.greaterThanOrEqualToSuperview().offset(16)
            make.right.lessThanOrEqualToSuperview().inset(16)
        }
        view.snp.makeConstraints { make in
            make.height.equalTo(Const.itemViewHeight)
        }
        
        return view
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        contentView.addSubview(background)
        background.addSubview(stackView)
        let messageView = itemViewBuilder("Сообщения")
        let reserveView = itemViewBuilder("Забронировать")
        messageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(messageTapped)))
        reserveView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reserveTapped)))
        stackView.addArrangedSubview(messageView)
        stackView.addArrangedSubview(reserveView)
        stackView.addArrangedSubview(addFriendView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().inset(12)
            make.left.greaterThanOrEqualToSuperview().offset(12)
            make.right.lessThanOrEqualToSuperview().inset(12)
            make.center.equalToSuperview()
        }
    }
    
    @objc
    private func addFriendTapped() {
        print("Tapped: add friend button")
    }
    
    @objc
    private func messageTapped() {
        print("Tapped: send message button")
    }
    
    @objc
    private func reserveTapped() {
        print("Tapped: reserve button")
    }

}
