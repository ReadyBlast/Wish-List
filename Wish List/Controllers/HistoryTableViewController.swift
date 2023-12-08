//
//  HistoryTableViewController.swift
//  Wish List
//
//  Created by XE on 07.12.2023.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "History"
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return DataManager.instance.wishesHistory.count
    }
     */
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return DataManager.instance.wishesHistory.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }

        // Configure the cell...
        let wish = DataManager.instance.wishesHistory[indexPath.row]
        cell.update(name: wish.name, description: wish.description)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let deleteAlert = UIAlertController(title: "Удалить элемент?", message: "Элемент будет удалён безвозратно. Вы уверены?", preferredStyle: .alert)
            let alertDeleteConfirm = UIAlertAction(title: "Удалить", style: .destructive) { UIAlertAction in
                DataManager.instance.removeFromHistory(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let alertDeleteCancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
            
            deleteAlert.addAction(alertDeleteCancel)
            deleteAlert.addAction(alertDeleteConfirm)
            
            present(deleteAlert, animated: true)
        }
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard segue.identifier == "showHistoryDetails",
              let destVC = segue.destination as? WishDetalisViewController else { return }
        
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
        let wish = DataManager.instance.wishesHistory[indexPath.row]
        
        destVC.wish = wish
        destVC.wishIndexPathInt = indexPath.row
        destVC.segueStatusFromMainTable = true
    }
    

}
