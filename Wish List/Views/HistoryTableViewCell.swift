//
//  HistoryTableViewCell.swift
//  Wish List
//
//  Created by XE on 07.12.2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var historyWishNameLabel: UILabel!
    @IBOutlet weak var historyDescWishNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        historyDescWishNameLabel.textColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(name: String, description: String?) {
        historyWishNameLabel.text = name
        historyDescWishNameLabel.text = description
    }
}
