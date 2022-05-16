//
//  SearchCollectionCellViewModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

struct SearchCollectionCellViewModel {
    let content :SearchModel
    
    var kind :String {
        return self.content.kind ?? ""
    }
    var trackName :String {
        return self.content.trackName ?? ""
    }
    var artworkUrl100 :String {
        return self.content.artworkUrl100 ?? ""
    }
}
