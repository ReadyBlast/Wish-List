//
//  WishListViewController.swift
//  Wish List
//
//  Created by XE on 22.11.2023.
//

import UIKit

class WishListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Wishes"
        navigationController?.navigationBar.tintColor = .black
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
                switch identifier {
                case "showNewWishScreen":
                    guard let newWishVC = segue.destination as? NewWishViewController else { return }
                    newWishVC.delegate = self
                case "showDetails":
                    guard let wishDetailsVC = segue.destination as? WishDetalisViewController,
                          let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
                    wishDetailsVC.delegate = self
                    let wish = DataManager.instance.wishes[indexPath.row]
                    wishDetailsVC.wish = wish
                    wishDetailsVC.wishIndexPathInt = indexPath.row
                    wishDetailsVC.segueStatusFromMainTable = false
                default:
                    return
                }
            }
    }
    
    @IBAction func backToMainScreen(_ sender: UIStoryboardSegue) {}

}

extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.instance.wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WishTableViewCell", for: indexPath) as? WishTableViewCell else {return UITableViewCell()}
        
        let wish = DataManager.instance.wishes[indexPath.row]
        cell.update(name: wish.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deleteAlert = UIAlertController(title: "Удалить элемент?", message: "Элемент будет удалён безвозратно. Вы уверены?", preferredStyle: .alert)
        let alertDeleteConfirm = UIAlertAction(title: "Удалить", style: .destructive) { UIAlertAction in
            DataManager.instance.removeWish(indexPathRow: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let alertDeleteCancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        deleteAlert.addAction(alertDeleteCancel)
        deleteAlert.addAction(alertDeleteConfirm)
        
        present(deleteAlert, animated: true)
    }
}

extension WishListViewController: NewWishDelegate {
    func reloadTableData() {
        tableView.reloadData()
    }
}
