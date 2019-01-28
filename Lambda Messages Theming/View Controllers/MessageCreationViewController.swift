//
//  MessageCreationViewController.swift
//  UIAppearanceAndAnimation
//
//  Created by Spencer Curtis on 8/21/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MessageCreationViewController: UIViewController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearances()
        navigationBar.delegate = self
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.topAttached
    }
    
    @IBAction func clearText(_ sender: Any) {
        messageTextView.text = ""
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        
        guard let message = messageTextView.text else { return }
        
        messageController?.createMessage(with: message, completion: { (_) in
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    private func setupAppearances() {
        view.backgroundColor = AppearanceHelper.backgroundGray
        messageTextView.font = AppearanceHelper.applicationFont(with: .body, pointSize: 28)
        messageTextView.layer.borderColor = UIColor.white.cgColor
        messageTextView.layer.borderWidth = 0.5
        messageTextView.textColor = .white
      //  messageTextView.textInputView.backgroundColor = AppearanceHelper.backgroundGray
        messageTextView.backgroundColor = AppearanceHelper.backgroundGray
        messageTextView.layer.cornerRadius = 8
        
        messageTextView.keyboardAppearance = .dark
        
        AppearanceHelper.style(button: clearTextButton)
        AppearanceHelper.style(button: sendMessageButton)
    }
    
    
    @IBAction func discardMessage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var messageController: MessageController?

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var clearTextButton: UIButton!
    @IBOutlet weak var sendMessageButton: UIButton!
}
