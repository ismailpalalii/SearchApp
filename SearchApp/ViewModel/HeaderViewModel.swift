//
//  HeaderViewModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

struct HeaderViewModel{
    let section :SegmentModel
    var title :String {
        return self.section.segmentTitle
    }
}
