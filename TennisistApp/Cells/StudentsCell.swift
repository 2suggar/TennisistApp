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
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 1000, height: 160), collectionViewLayout: cvLayout)
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
        contentView.addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension StudentsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "student.cell", for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
}
