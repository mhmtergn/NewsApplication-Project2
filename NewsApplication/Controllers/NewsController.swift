//
//  NewsController.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-29.
//

import UIKit

class NewsController: UIViewController, UIGestureRecognizerDelegate {

    let newsService: NewsServiceProtocol = NewsService()
    lazy var items: [Result] = []
    
    let imageNames = ["science", "economy", "technology", "sport"]

    let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        initService()
        configureNavigation()

    }
    
    private func configureNavigation() {
        navigationItem.title = "Sport News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "News Category"
        navigationController?.navigationBar.tintColor = .black
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func initService() {
        newsService.fetchNews( response: { [weak self] modul in
            guard let modul = modul else { return }
            self?.items = modul
            self?.tableView.reloadData()
        }, topic: "sports")
      
    }

    private func initDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func configureTableView() {
        view.addSubview(tableView)
        self.initDelegate()

    }
}

extension NewsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell

        cell.sourceLabel.text = items[indexPath.row].source_id?.uppercased()
        if items[indexPath.row].description != nil {
            cell.descriptionLabel.text = items[indexPath.row].description
        }else {
            cell.descriptionLabel.text = items[indexPath.row].title
        }
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 0
        cell.layer.borderWidth = 42
        cell.layer.borderColor = CGColor(red: 00, green: 0, blue: 0, alpha: 0)
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let openURL = URL(string: items[indexPath.row].link!) {
            UIApplication.shared.open(openURL, options: [:]) { (done) in
                print("link was opened")
            }
        }
    }
}
