//
//  HomeView.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit

final class HomeView: BaseView {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBAction func didTap(OnFavorite sender: UIButton) -> Void{
        saveFavorite(viewModel.data)
    }

    @IBAction func didTap(OnMyFavorites sender: UIButton) -> Void{
        navigationController?.pushViewController(MyFavView(), animated: true)
    }

    @IBAction func didTap(OnReload sender: UIButton) -> Void{
        viewModel.getData()
    }

    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Quote"
        viewModel.view = self
        viewModel.data = getLocalQuote()
        refreshUI()
        viewModel.getData()
    }
    
    func refreshUI() -> Void {
        saveFavorite(viewModel.data, locally: true)
        quoteLabel.text = viewModel.data?.getQuote
        authorLabel.text =  viewModel.data?.getAuthor
    }
}

extension HomeView: HomeViewProtocol{
    func didFailWithError(_ error: String) {
        // show error message
    }
    
    func didFailWithError(_ error: NSError, isNetwork: Bool) {
        // show error message
    }
    
    func loading(_ start: Bool) {
        loadView(start)
    }
    
    func successFetchingData() {
        refreshUI()
    }
}
