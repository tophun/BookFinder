//
//  Volume.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//

import Foundation

struct Volume: Codable {
    var id: String
    var etag: String
    var selfLink: String
    var volumeInfo: VolumeInfo?
    
    enum CodingKeys: String, CodingKey {
        case id, etag, selfLink, volumeInfo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? container.decodeIfPresent(String.self, forKey: .id)) ?? ""
        etag = (try? container.decodeIfPresent(String.self, forKey: .etag)) ?? ""
        selfLink = (try? container.decodeIfPresent(String.self, forKey: .selfLink)) ?? ""
        volumeInfo = try? container.decodeIfPresent(VolumeInfo.self, forKey: .volumeInfo)
    }
}
