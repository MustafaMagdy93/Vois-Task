//
//  GetImageResponse.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 19/02/2023.
//

import Foundation

struct GetImageResponse: Codable {
    var id: String?
    var author: String?
    var width, height: Int?
    var url, downloadURL: String?
    var isGoogleAds: Bool?
    
    enum CodingKeys : String, CodingKey {
            case downloadURL = "download_url", id, author, width, height, url
        }
}
