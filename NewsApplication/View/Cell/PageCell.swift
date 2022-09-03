//
//  PageCell.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-28.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let imageNames = ["science", "economy", "technology", "sport"]
    let newsLabel = UITextView()
    let imageView = UIImageView(image: UIImage(named: "technology"))
    
    static let identifier = "PageCell"

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()

        configureCell()
    }

    private func configureCell() {

        newsLabel.text = "News"
        newsLabel.font = UIFont.boldSystemFont(ofSize: 25)
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.textAlignment = .center
        newsLabel.isEditable = false
        newsLabel.contentMode = .scaleToFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
    }

    private func setupLayout() {

        addSubview(newsLabel)
        newsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        newsLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        let imageContainerView = UIView()

        addSubview(imageContainerView)

        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 40).isActive = true
        imageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageContainerView.addSubview(imageView)

        imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 70).isActive = true
        imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -70).isActive = true

        imageView.topAnchor.constraint(equalTo: newsLabel.bottomAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100).isActive = true

        imageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
