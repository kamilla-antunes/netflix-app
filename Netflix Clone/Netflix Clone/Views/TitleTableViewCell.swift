//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 15/09/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    private lazy var playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabelTitleImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titlePosterImageView, titleLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var titlePlayButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabelTitleImageStackView, playTitleButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.isUserInteractionEnabled = true
        
        contentView.addSubview(titleLabelTitleImageStackView)
        contentView.addSubview(titlePlayButtonStackView)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titlePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            titlePosterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titlePlayButtonStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePlayButtonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titlePlayButtonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titlePlayButtonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            titleLabelTitleImageStackView.trailingAnchor.constraint(equalTo: titlePlayButtonStackView.trailingAnchor, constant: -32)
        ])
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: Constants.imageURL + model.posterPath) else { return }
        
        titlePosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
}
