//
//  MessageVCNew.swift
//  iosExample
//
//  Created by jeremy beal on 4/4/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

//import Foundation
import UIKit
import PocketEth
import MessageKit
import MessageInputBar
import PocketAion
import BigInt
import Pocket



class MessageVCNew: MessagesViewController {
    
    var data:Data!
    
    var messages: [Message] = []
    var member: Member!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO i need to somehow add the wallet ID for identification for "member"
        // from the VC
        member = Member(name: "bluemoon")
        messagesCollectionView.messagesDataSource = self as! MessagesDataSource
        messagesCollectionView.messagesLayoutDelegate = self as? MessagesLayoutDelegate
        messageInputBar.delegate = self as! MessageInputBarDelegate
        messagesCollectionView.messagesDisplayDelegate = self as? MessagesDisplayDelegate
        
        // creates the money image, button, and binds it to the message input bar.
        
        let moneyImage = UIImage(named: "Btc")
        let moneyView = UIImageView(image: moneyImage)
        
        let moneyItem = InputBarButtonItem(type: .system)
        moneyItem.setSize(CGSize(width: 60, height: 30), animated: false)
        moneyItem.image = moneyImage
        moneyItem.addTarget(self, action: #selector(MessageVC.sendMoney(_:)), for: .touchUpInside)
        
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        messageInputBar.setStackViewItems([moneyItem], forStack: .left, animated: false)
        
    }
    
    // creates the action for when someone wants to sendMoney
    @objc func sendMoney(_ sender:UIButton!){
        
        
        let address = "0xa0510dd236472e90f0ff4f6b7b4f70b1d8c5206cf303839f9a4e8fa6af0dd420"
        let privateKey = "0xd0c6208eb958998dcdac23bedf7d58d863c5abe64e250e4e379a4efd3966cd99e5cab1be5be1655abc987ff7321a438581778919b859370cf1faa22346b201fc"
        
        let nonce = BigInt.init(13)
        let to =  "0xa0d969df9232b45239b577c3790887081b5a22ffd5a46a8d82584ee560485624"
        let value =  BigInt.init(10000)
        let nrgPrice = BigInt.init(10000000000)
        let nrg = BigInt.init(21000)
        
        do {
            
            
            let importWallet = try PocketAion.importWallet(privateKey: privateKey, subnetwork: "32", address: address, data: nil)
            
            try PocketAion.eth.sendTransaction(wallet: importWallet, nonce: nonce, to: to, data: "", value: value, nrgPrice: nrgPrice, nrg: nrg, handler: { (result, error) in
                
                if error != nil {
                    print(error!)
                    return
                } else {
                    
                    print("the hash:", result!)
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Success", message: "you have Sucessfully sent \(value) AMP. The hash is\(result!)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
            })
            
        } catch{
            print(error)
        }
        
        
        
    }
    
}

extension MessageVCNew: MessagesLayoutDelegate {
    
    
    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
}


extension MessageVCNew: MessagesDisplayDelegate {
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
        
        //let message = messages[indexPath.section]
        
    }
}

extension MessageVCNew: MessagesDataSource {
    
    func currentSender() -> Sender {
        return Sender(id: member.name, displayName: "Steven")
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}

//This allows us to actually send a new message. For now, we'll just append the message onto the array

extension MessageVCNew: MessageInputBarDelegate {
    func messageInputBar( _ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        
        let pocketAion = PocketAion.init()
        let contractAddress = "0xa0f9b0086fdf6c29f67c009e98eb31e1ddf1809a6ef2e44296a377b37ebb9827"
        //let contractABI = [{"outputs":[],"constant":false,"payable":false,"inputs":[{"name":"newMessage","type":"string"}],"name":"setMessage","type":"function"},{"outputs":[{"name":"","type":"string"}],"constant":true,"payable":false,"inputs":[],"name":"getMessage","type":"function"},{"outputs":[{"name":"","type":"string"}],"constant":true,"payable":false,"inputs":[],"name":"message","type":"function"}]
        
        //let aionontract = try AionContract.init(pocketAion: pocketAion, abiDefinition: contractABI, contractAddress: contractAddress, subnetwork: "32")
        
        
        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        
        
        
        
        messages.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}
