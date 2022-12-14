//
//  ColletionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 12/09/22.
//

import UIKit

class ColletionViewTableViewCell: UITableViewCell {
    static let identifier = "ColletionViewTableViewCell"
    
    private var titles = [Title]()
    
    private lazy var colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)

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
    
    public func configure(with titles: [Title]) {
        self.titles = titles
        
        DispatchQueue.main.async { [weak self] in
            self?.colletionView.reloadData()
        }
    }
}

extension ColletionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let model = titles[indexPath.row].posterPath else { return UICollectionViewCell() }
        cell.configure(with: model)
        
        return cell
    }
}
