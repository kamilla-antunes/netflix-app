//
//  ColletionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 12/09/22.
//

import UIKit

class ColletionViewTableViewCell: UITableViewCell {
    
    static let identifier = "ColletionViewTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
