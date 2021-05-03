//
//  MainViewController.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    private let backgroundImageView = UIImageView()
    
    let scrollView = UIScrollView()
    
    let profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Private functions
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImageView)
        view.addSubview(scrollView)
        scrollView.addSubview(profileView)
        
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1582)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        profileView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(self.view.bounds.width)
            make.bottom.equalToSuperview().offset(60)
        }
    }
}
