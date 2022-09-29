//
//  MessagesListTableViewController.swift
//  messages
//
//  Created by Jicell on 9/28/22.
//

import UIKit

class MessagesListTableViewController: UITableViewController {
    
  

    // MARK: - Table view data source
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return MessageController.shared.messages.count

    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessagesTableViewCell else { return UITableViewCell() }
        let message = MessageController.shared.messages[indexPath.row]
        cell.updateViews(message: message)
        cell.delegate = self
        return cell
    }


    
    @IBAction func addMessagesButtonTapped(_ sender: Any) {
        
    }
    
}
extension MessagesListTableViewController: MessageTableViewCellDelegate {
    
    func markAsReadButtonWasTapped(_ cell: MessagesTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let message = MessageController.shared.messages[indexPath.row]
        MessageController.shared.toggleIsRead(message: message)
        cell.updateViews(message: message)
    }
}
