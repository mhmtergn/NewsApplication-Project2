//
//  ViewController.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-28.
//

import UIKit

class ViewController: UIViewController {

    let blackLine = UIView()
    let newsLabel = UITextView()
    let imageView = UIImageView(image: UIImage(named: "science"))
    let categoryText = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(newsLabel)
        view.addSubview(imageView)
        
        setupLayout()
        configureView()
    }

    private func configureView() {
        blackLine.backgroundColor = .black
        blackLine.translatesAutoresizingMaskIntoConstraints = false
        blackLine.contentMode = .scaleAspectFit

        newsLabel.text = "News"
        newsLabel.font = UIFont.boldSystemFont(ofSize: 25)
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.textAlignment = .center
        newsLabel.isEditable = false
        newsLabel.contentMode = .scaleToFill

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.isOpaque = true
        imageView.layer.opacity = 0.9
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40

    }

    private func setupLayout() {

        newsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        newsLabel.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        newsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        let imageContainerView = UIView()

        view.addSubview(imageContainerView)

        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageContainerView.addSubview(imageView)

        imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: 70).isActive = true
        imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -70).isActive = true
        imageView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

        imageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true

    }
}



