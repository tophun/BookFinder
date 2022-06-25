//
//  VolumesResponse.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import Foundation

struct VolumesResponse: Codable {
    var items: [Volume]
    var totalItems: Int
    
    enum CodingKeys: String, CodingKey {
        case items, totalItems
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = (try? container.decodeIfPresent([Volume].self, forKey: .items)) ?? []
        totalItems = (try? container.decodeIfPresent(Int.self, forKey: .totalItems)) ?? 0
    }
}
