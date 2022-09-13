//
//  ColletionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 12/09/22.
//

import UIKit

class ColletionViewTableViewCell: UITableViewCell {
    static let identifier = "ColletionViewTableViewCell"
    
    private let colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        colletionView.delegate = self
        colletionView.dataSource = self
        
        addSubviews()
    }
    
    private func addSubviews() {
        contentView.addSubview(colletionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        colletionView.frame = contentView.bounds
    }
}

extension ColletionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
}
