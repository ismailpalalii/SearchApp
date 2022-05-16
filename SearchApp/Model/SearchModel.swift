//
//  SearchModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

struct SearchModel: Codable {
    var wrapperType: String?
    var kind: String?
    var collectionName: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var explicitness: String?
    var trackName: String?
    var artistName: String?
    var previewUrl: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var releaseDate: String?
    var country: String?
    var currency: String?
    var shortDescription: String?
    var longDescription: String?
    var primaryGenreName: String?
    var releaseNotes: String?
    var description: String?
    var ratingIndex: String?
    var showTerm: String?
}
