//
//  SwipingControllers.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-28.
//

import UIKit

class SwipingControllers: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            
        } completion: { (_) in
        }
    }
    
    let imageNames = ["sport", "economy", "technology", "science"]
    var newsItems : [Result] = []
    let newsService: NewsServiceProtocol = NewsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(PageCell.self, forCellWithReuseIdentifier: PageCell.identifier)
        collectionView.isPagingEnabled = false

        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCell.identifier, for: indexPath) as! PageCell
        


        
        let imageName = imageNames[indexPath.row]
        
        cell.imageView.image = UIImage(named: imageName)
        cell.newsLabel.text = imageNames[indexPath.row].uppercased()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newsController = NewsController()
        self.navigationController?.pushViewController(newsController, animated: true)
        
        
    }
}


