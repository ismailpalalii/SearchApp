//
//  SearchResponseModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

struct SearchResponseModel: Codable {
    var resultCount: Int
    var results: [SearchModel]
}
