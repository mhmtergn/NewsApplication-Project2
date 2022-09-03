//
//  NewsModel.swift
//  NewsApp(Project2)
//
//  Created by Mehmet Ergün on 2022-08-28.
//

import Foundation

struct NewsModel: Decodable {
    let results: [Result]?
}

// MARK: - Result
struct Result: Decodable {
    let title: String?
    let link: String?
    let description: String?
    let pubDate: String?
    let image_url: String?
    let source_id: String?
    let country, category: [String]?
    let language: String?
    let content: String?
}
