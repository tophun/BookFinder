//
//  VolumeInfo.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import Foundation

struct VolumeInfo: Codable {
    var title: String
    var authors: [String]
    var publishedDate: String
    var imageLinks: ImageLinks?
    var previewLink: String
    
    enum CodingKeys: String, CodingKey {
        case title, authors, publishedDate, imageLinks, previewLink
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = (try? container.decodeIfPresent(String.self, forKey: .title)) ?? ""
        authors = (try? container.decodeIfPresent([String].self, forKey: .authors)) ?? []
        publishedDate = (try? container.decodeIfPresent(String.self, forKey: .publishedDate)) ?? ""
        imageLinks = try? container.decodeIfPresent(ImageLinks.self, forKey: .imageLinks)
        previewLink = (try? container.decodeIfPresent(String.self, forKey: .previewLink)) ?? ""
    }
}
