//
//  HomeViewModel.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
}

final class HomeViewModel: BaseViewModel{
    var data: QuoteModel?
    var view: HomeViewProtocol?
    
    func getData() -> Void {
        view?.loading(true)
        QuoteModel.getRandomQuote { (response) in
            self.view?.loading(false)
            switch response{
            case .success(let model):
                self.data = model
                self.view?.successFetchingData()
            case .failure:
                self.view?.didFailWithError("some thing went wrong")
            case .networkError(let error):
                self.view?.didFailWithError(error, isNetwork: true)
            }

        }
    }
}

