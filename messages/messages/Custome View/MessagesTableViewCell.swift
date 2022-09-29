//
//  MessagesTableViewCell.swift
//  messages
//
//  Created by Jicell on 9/28/22.
//

import UIKit
/// A custom table view cell used for rendering the contents of a Message instance
protocol MessageTableViewCellDelegate:AnyObject {
    func markAsReadButtonWasTapped(_ cell: MessagesTableViewCell)
    
}

class MessagesTableViewCell: UITableViewCell {

    /// A label for the contents of the message

    @IBOutlet weak var messageTextLabel: UILabel!
    
    /// A lable for the date of the message
    @IBOutlet weak var dateTextLabel: UILabel!
    
        /// A button which can be used to indicate and change if the message is marked as read
    @IBOutlet weak var markAsReadButton: UIButton!
    
    weak var delegate: MessageTableViewCellDelegate?
    


        /// A date formatter used to conver the messages date into a coherent string
    var dateFormatter = DateFormatter.short()
     

        /// Updates the table view cells views for the given messages content
        /// - Parameter message: The message to display in the cell
          
    func updateViews(message: Message) {
        messageTextLabel.text = message.text
        dateTextLabel.text = dateFormatter.string(from: message.timeStamp)
        let readMessageImageName = message.isRead ? "checkmark.circle" : "circle"
        let readImage = UIImage(systemName: readMessageImageName)
        markAsReadButton.setImage(readImage, for: .normal)
        
        
    }
    
    
    @IBAction func readButtonTapped(_ sender: Any) {
        
    }
    
}
