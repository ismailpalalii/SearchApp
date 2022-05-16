//
//  SearchAPI.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

class SearchAPI {
    
    static let shared = SearchAPI()
    let baseUrl = "https://itunes.apple.com/search?"
    var items :[SearchModel] = []
    
    func getContentResponseWithSearch(searchLink: URL, completion: @escaping ([SegmentModel]? , Int) -> ()){
        
        let task = URLSession.shared.sendRequest(url: searchLink, completionHandler:{(result: SearchResponseModel?, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil, 0)
                return
            }
            if let model = result?.results{
                self.items.append(contentsOf: model)
                completion(self.groupAndCreateSectionList(contentList:self.items) , model.count)
            }
            else{
                completion(nil, 0)
            }
        })
        task.resume()
    }
    
    func getServiceURL(word: String, itemsPerPage:Int, offset: Int)->URL{
        let url = URL(string: baseUrl + "term=\(word)&limit=\(itemsPerPage)&offset=\(offset)")!
        return url
    }
    
    func groupAndCreateSectionList( contentList:[SearchModel]) ->[SegmentModel]?{
        let groupedByWrapper = Dictionary(grouping: contentList) { $0.wrapperType }
        var newList = [SegmentModel]()
        for (key,valueList) in groupedByWrapper{
            let list = valueList
            let name = key ?? ""
            let segment = SegmentModel(segmentTitle: name, contentList: list)
            newList.append(segment)
        }
        let sortedList = newList.sorted(by: { $0.segmentTitle < $1.segmentTitle })
        return sortedList

    }
}
