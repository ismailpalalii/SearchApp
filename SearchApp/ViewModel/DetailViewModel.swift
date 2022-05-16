//
//  DetailViewModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

struct DetailViewModel{

    let content :SearchModel

    var artworkUrl100 :String {
        return self.content.artworkUrl100 ?? ""
    }
    var trackName :String {
        return self.content.trackName ?? ""
    }
    var releaseDate :String {
        return self.content.releaseDate ?? ""
    }
    var primaryGenreName :String {
        return self.content.primaryGenreName ?? ""
    }
}
