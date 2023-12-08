//
//  WishTableViewCell.swift
//  Wish List
//
//  Created by XE on 22.11.2023.
//

import UIKit

class WishTableViewCell: UITableViewCell {
    @IBOutlet private weak var wishNameLabel: UILabel!
    @IBOutlet private weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        statusView.layer.cornerRadius = statusView.bounds.width / 2.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(name: String) {
        wishNameLabel.text = name
    }
}

 
