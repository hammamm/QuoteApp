//
//  MyFavViewModel.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit

final class MyFavViewModel: BaseViewModel {
    var data: [QuoteModel]?
    
    func configuration(_ tableView: UITableView) -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: QuoteTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: QuoteTableViewCell.identifier)
        tableView.estimatedRowHeight = QuoteTableViewCell.height
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension MyFavViewModel: tableViewDelegates{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.identifier) as? QuoteTableViewCell else {
            return UITableViewCell()
        }
        cell.data = data?[indexPath.row]
        return cell
    }
}
