//
//  SearchListViewModel.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import Foundation

final class SearchListViewModel{
    
    weak var delegate: SearchListViewModelDelegate?
    
    // MARK: - Private Properties
    private var searchSegmentList :[SegmentModel]
    private let itemsPerPage = 20
    private var page = 0
    private var hasNextPage:Bool = false
    private var isLoading: Bool = false

    // MARK: - Init
    init(){
        searchSegmentList = []
    }
    
    // MARK: - Public Methods
    
     func getDataFromService(text: String) {
        let trimmedText =  text.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "+")
        let path = SearchAPI.shared.getServiceURL(word: trimmedText, itemsPerPage: itemsPerPage, offset: itemsPerPage * page)
        isLoading = true;
         SearchAPI.shared.getContentResponseWithSearch(searchLink: path) { sectionList, count in
            if let sectionList = sectionList {
                    self.searchSegmentList = sectionList
                    if(count == self.itemsPerPage){
                        self.hasNextPage = true
                    }
                    else{
                        self.hasNextPage = false
                    }
                    self.isLoading = false
                    self.delegate?.dataLoadedFromService()
            }
            else {
                self.isLoading = false
            }
        }
       
    }
    func scrollViewDidScrollBottom(text: String){
        if(hasNextPage){
            page += 1
            getDataFromService(text: text)
        }
    }
    func clearAllValues(){
        hasNextPage = false
        page = 0
        isLoading = false
        searchSegmentList = []
    }
    func isLoadingValue() ->Bool {
        return self.isLoading
    }
    func hasNextPageValue() ->Bool {
        return self.hasNextPage
    }
    func numberOfSections() -> Int{
        return searchSegmentList.count
    }
    
    func numberOfRowsInSections(_ section :Int) -> Int{
        if self.searchSegmentList.count > 0{
            let section = self.searchSegmentList[section]
            return SegmentViewModel(segment: section).contentList.count

        }
        return 0
    }
    
    func contentAtSectionAndIndex(_ section :Int, _ index :Int) -> SearchCollectionCellViewModel{
        let section = self.searchSegmentList[section]
        let content = SegmentViewModel(segment: section).contentList[index]
        return SearchCollectionCellViewModel(content: content)
    }
    
    func getHeaderViewModel(_ section :Int) -> HeaderViewModel{
        let section = self.searchSegmentList[section]
        return HeaderViewModel(section: section)
    }
    
    func getDetailViewModel(_ segment :Int, _ index :Int) -> DetailViewModel{
        let segment = self.searchSegmentList[segment]
        let content = SegmentViewModel(segment: segment).contentList[index]
        return DetailViewModel(content: content)
    }
   
    func collectionCellSelected(_ section :Int, _ index :Int)->DetailViewModel{
        let content = self.getDetailViewModel(section, index)
        return content
    }
}


// MARK: - Delegate
protocol SearchListViewModelDelegate: NSObject {
    func dataLoadedFromService()
}

//MARK SegmentViewModel
struct SegmentViewModel{
    let segment :SegmentModel
    
    var segmentTitle :String {
        return self.segment.segmentTitle
    }
    var contentList :[SearchModel] {
        return self.segment.contentList
    }
}

