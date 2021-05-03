//
//  StudentsCell.swift
//  TennisistApp
//
//  Created by Ekaterina Akulina on 29.04.2021.
//

import UIKit

class StudentsCell: UITableViewCell {

    private let collectionView: UICollectionView = {
        let cvLayout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
        cv.allowsSelection = false
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "student.cell")
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.equalTo(200)
        }
    }

}

extension StudentsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "student.cell", for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
