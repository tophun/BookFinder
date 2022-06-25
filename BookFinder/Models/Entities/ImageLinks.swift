//
//  ImageLinks.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import Foundation

struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case smallThumbnail, thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        smallThumbnail = (try? container.decodeIfPresent(String.self, forKey: .smallThumbnail)) ?? ""
        thumbnail = (try? container.decodeIfPresent(String.self, forKey: .thumbnail)) ?? ""
    }
}
