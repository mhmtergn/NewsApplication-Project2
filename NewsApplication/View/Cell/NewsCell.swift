//
//  NewsCell.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-29.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let identifier = "NewsCell"
    
     let titleLabel = UILabel()
     let sourceLabel = UILabel()
     let myImageView = UIImageView()
     let descriptionLabel = UILabel()
        
    private let sourceUnderlineView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(myImageView)
        addSubview(sourceLabel)
        addSubview(sourceUnderlineView)
        addSubview(descriptionLabel)
        
        self.configureCell()
        self.sourceLabelConstraints()
        self.sourceLabelUnderlineConstraints()
        self.configureDescriptionLabel()

    }
    
    private func configureCell() {
        descriptionLabel.textAlignment = .justified
        descriptionLabel.numberOfLines = 0
        sourceUnderlineView.backgroundColor = .black
        sourceLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.adjustsFontSizeToFitWidth = true
        sourceLabel.font = UIFont.italicSystemFont(ofSize: 16)
        
    }


    private func sourceLabelConstraints() {
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15).isActive = true
        sourceLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20).isActive = true
    }

    private func sourceLabelUnderlineConstraints() {
        sourceUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        sourceUnderlineView.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor).isActive = true
        sourceUnderlineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        sourceUnderlineView.trailingAnchor.constraint(equalTo: sourceLabel.trailingAnchor).isActive = true
        sourceUnderlineView.leadingAnchor.constraint(equalTo: sourceLabel.leadingAnchor).isActive = true

    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
