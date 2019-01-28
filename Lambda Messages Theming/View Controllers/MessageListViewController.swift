//
//  MessageListViewController.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let messageController = MessageController()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.timeStyle = .long
        formatter.dateStyle = .short
        
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView?.backgroundColor = AppearanceHelper.backgroundGray
        NotificationCenter.default.addObserver(self, selector: #selector(sortMessageArray), name: messagesWereUpdatedNotification, object: nil)
        
        messageController.fetchMessages()
      //  styleNewMessageButton()
        setupAppearances()
       
    }
    
    @objc private func sortMessageArray() {
        switch messageSortSegmentedControl.selectedSegmentIndex {
        case 0:
            messageController.messages.sort(by: { $0.timestamp < $1.timestamp })
        case 1:
            messageController.messages.sort(by: { $0.timestamp > $1.timestamp })
        default:
            break
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageController.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        
        let message = messageController.messages[indexPath.row]
        
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = message.sender
        
        style(cell: cell)
        
        return cell
    }
    
    private func style(cell: UITableViewCell) {
        cell.textLabel?.font = AppearanceHelper.applicationFont(with: .caption1, pointSize: 30)
        cell.detailTextLabel?.font = AppearanceHelper.applicationFont(with: .caption2, pointSize: 25)
        cell.textLabel?.backgroundColor = .clear
        cell.detailTextLabel?.backgroundColor = .clear
        
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        
        cell.backgroundColor = AppearanceHelper.backgroundGray
    }
    
    private func setupAppearances() {
        view.backgroundColor = AppearanceHelper.backgroundGray
        tableView.backgroundColor = AppearanceHelper.backgroundGray
        tableView.tableHeaderView?.backgroundColor = AppearanceHelper.backgroundGray
        
        AppearanceHelper.style(button: newMessageButton)
        newMessageButton.layer.cornerRadius = newMessageButton.frame.width / 2
        newMessageButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
    }
    
//    private func styleNewMessageButton() {
//        newMessageButton.backgroundColor = AppearanceHelper.lambdaRed
//        //Which ever is bigger will be returned.
//        let cornerRadius = max(newMessageButton.frame.width, newMessageButton.frame.height) / 2.0
//        newMessageButton.layer.cornerRadius = cornerRadius
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateMessage" {
            guard let destinationVC = segue.destination as? MessageCreationViewController else { return }
            
            destinationVC.messageController = messageController
        }
    }

    @IBAction func sortMessages(_ sender: Any) {
        sortMessageArray()
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageButton: UIButton!
    @IBOutlet weak var messageSortSegmentedControl: UISegmentedControl!
}
