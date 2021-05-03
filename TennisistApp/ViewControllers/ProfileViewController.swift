//
//  ProfileViewController.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit
import SnapKit

fileprivate enum TableSectionsKind {
    case profileInfo
    case mainInfo
    case connection
    case reviews
    case students
}

class ProfileViewController: UIViewController {
    
    // MARK: Private variables
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 89
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Vasilii")
        return imageView
    }()
    
    private let tennisBallView = UIImageView(image: UIImage(named: "ball"))
    
    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Private functions
    private func setupUI() {
        view.backgroundColor = UIColor(red: 28/255.0, green: 28/255.0, blue: 30/255.0, alpha: 1)
        view.layer.cornerRadius = 34
        
        view.addSubview(avatarImageView)
        view.addSubview(tennisBallView)
        view.addSubview(tableView)
        
        setupTableView()
        setupConstraints()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 0))
        tableView.register(MainInfoCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 1))
        tableView.register(ConnectionCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 2))
        tableView.register(ReviewCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 3))
        tableView.register(StudentsCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 4))
        tableView.register(SeparatorCell.self, forCellReuseIdentifier: cellIdentifier(forSection: 5))
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.snp.top)
            make.size.equalTo(178)
        }
        
        tennisBallView.snp.makeConstraints { make in
            make.centerX.equalTo(avatarImageView.snp.centerX).offset(70)
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(70)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func cellIdentifier(forSection index: Int) -> String {
        switch index {
        case 0:
            return "profile"
            
        case 1:
            return "main.info"
            
        case 2:
            return "connection"
            
        case 3:
            return "review"
            
        case 4:
            return "students"
            
        case 5:
            return "separator"
            
        default:
            return ""
        }
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 4:
            return 1
        
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row % 2 == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(forSection: 5), for: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(forSection: indexPath.section), for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 3 || section == 4 else {
            return UIView()
        }
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! CustomHeaderView
        if section == 3 {
            view.headerString = "Отзывы"
            view.additionalString = "Еще отзывы (15)"
        } else {
            view.headerString = "Ученики"
            view.additionalString = "Все ученики (8)"
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 3 || section == 4 else {
            return 0
        }
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
