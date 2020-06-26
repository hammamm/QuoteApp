//
//  MyFavView.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit

final class MyFavView: BaseView {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFavoriteLabel: UILabel!
    var viewModel = MyFavViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My favorite quote"
        configuration()
        getData()
    }

    func configuration() -> Void {
        viewModel.configuration(tableView)
    }
    
    func getData() -> Void {
        viewModel.data = getFavoriteQuotes()
        noFavoriteLabel.isHidden = (viewModel.data?.count ?? 0) > 0
        tableView.reloadData()
    }

}
