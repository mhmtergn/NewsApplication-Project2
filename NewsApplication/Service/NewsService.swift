//
//  NewsService.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-28.
//

import Foundation
import Alamofire

protocol NewsServiceProtocol {
    func url(with topicName: String) -> String
    func fetchNews(response: @escaping ([Result]?) -> Void, topic: String)
}


struct NewsService: NewsServiceProtocol {
    func url(with topicName: String) -> String {
        
        let urlString = "https://newsdata.io/api/1/news?apikey=pub_10890ce77f7233e711ff1d623290c6b1ab467&country=ca&category=\(topicName)"
        
        return urlString
        
    }
    
    
 
    func fetchNews(response: @escaping ([Result]?) -> Void, topic: String) {
        AF.request(url(with: topic)).validate().responseDecodable(of: NewsModel.self) { modul in
            guard let items = modul.value else {
                print(modul.debugDescription)
                return
            }
            response(items.results)
        }
    }
    }
