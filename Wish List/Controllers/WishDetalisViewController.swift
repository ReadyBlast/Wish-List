//
//  WishDetalisViewController.swift
//  Wish List
//
//  Created by XE on 06.12.2023.
//

import UIKit

class WishDetalisViewController: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var wish: Wish?
    var wishIndexPathInt: Int?
    var segueStatusFromMainTable: Bool? 
    weak var delegate: NewWishDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Wish Details"
        
        nameLabel.text = wish?.name
        descriptionLabel.text = wish?.description
        doneButton.isHidden = segueStatusFromMainTable ?? true
    }
    
    @IBAction private func donePressed(_ sender: Any) {
        guard let wishIPInt = wishIndexPathInt else {return}
        DataManager.instance.makeAsDone(wish: wish!, indexPathRow: wishIPInt)
        delegate?.reloadTableData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
