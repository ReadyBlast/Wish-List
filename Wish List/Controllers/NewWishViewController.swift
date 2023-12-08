//
//  NewWishViewController.swift
//  Wish List
//
//  Created by XE on 22.11.2023.
//

import UIKit

class NewWishViewController: UIViewController {
    @IBOutlet private weak var wishTextField: UITextField!
    @IBOutlet private weak var wishDescTextField: UITextField!
    
    weak var delegate: NewWishDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "New Wish"
    }
    
    @IBAction private func saveButtonPressed(_ sender: Any) {
        guard let name = wishTextField.text, !name.isEmpty else { return }
        let newWish = Wish(name: name, description: wishDescTextField.text)
        DataManager.instance.addWish(newWish)
        delegate?.reloadTableData()
        navigationController?.popViewController(animated: true)
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
