//
//  GetImageResponse.swift
//  VoiseTask
//
//  Created by Mustafa Magdy on 19/02/2023.
//

import Foundation

struct GetImageResponse: Codable {
    let id: String?
    let author: String?
    let width, height: Int?
    let url, downloadURL: String?
}
