//
//  SearchPresenter.swift
//  BookFinder
//
//  Created by Tophun on 2022/06/26.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchPresentationLogic {
    func presentSearch(response: Search.Search.Response)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    func presentSearch(response: Search.Search.Response) {
        if let error = response.error {
            viewController?.displayError(error: error)
            return
        }
        
        var resultItems: [Search.Search.ViewModel.ResultModel] = []
        response.items.forEach {
            let resultItem = Search.Search.ViewModel.ResultModel(
                thumnailURL: $0.volumeInfo?.imageLinks?.smallThumbnail ?? "",
                title: $0.volumeInfo?.title ?? "",
                author: $0.volumeInfo?.authors.joined(separator: ",") ?? "",
                publishedDate: $0.volumeInfo?.publishedDate ?? ""
            )
            resultItems.append(resultItem)
        }
        let viewModel = Search.Search.ViewModel(
            resultItems: resultItems,
            totalItems: response.totalItems
        )
        viewController?.displaySearch(viewModel: viewModel)
    }
}
