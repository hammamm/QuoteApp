//
//  QuoteTableViewCell.swift
//  QuoteApp
//
//  Created by hammam abdulaziz on 05/11/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    static let identifier = "QuoteTableViewCell"
    static let height: CGFloat = 74
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var data: QuoteModel?{
        didSet{
            quoteLabel.text = data?.getQuote
            authorLabel.text = data?.getAuthor
        }
    }
}
