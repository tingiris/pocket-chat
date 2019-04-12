//
//  MessageVC.swift
//  iosExample
//
//  Created by jeremy beal on 3/14/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar



class MessageVC: MessagesViewController {
    
    let user1_Pub = "0x8d5Cd515c8696d917139Cd9091c84AC59B766046"
    let user1_Priv = "1390b7268f37df81d76db982961de67646506fe70e28f83b32ca97b8ff02a913"
    
    //let wallet = PocketEth.importWallet(privateKey: user1_Priv, subnetwork: "4", address: user1_Pub, data: nil)
    
    var data:Data!

    var messages: [Message] = []
    var userInput: String = ""
    var member: Member!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO i need to somehow add the wallet ID for identification for "member"
        // from the VC
        member = Member(name: "bluemoon")
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self as? MessagesLayoutDelegate
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self as? MessagesDisplayDelegate

        // creates the money image, button, and binds it to the message input bar.
        
       let moneyImage = UIImage(named: "Btc")
       //let moneyView = UIImageView(image: moneyImage)
        
       let moneyItem = InputBarButtonItem(type: .system)
        moneyItem.setSize(CGSize(width: 60, height: 30), animated: false)
        moneyItem.image = moneyImage
        moneyItem.addTarget(self, action: #selector(MessageVC.sendMoney(_:)), for: .touchUpInside)
        
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        messageInputBar.setStackViewItems([moneyItem], forStack: .left, animated: false)
        
    }
    
    private func sendtoContract(userInput: String) {
        
        let contractAddress = "0x1127AB2eF75626c24aACf1676FfcE108aFa774bF"
        
        let functionABI = "[{\"constant\":false,\"inputs\":[{\"name\":\"_toAddress\",\"type\":\"address\"},{\"name\":\"_toText\",\"type\":\"string\"}],\"name\":\"appendText\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[],\"name\":\"iteratetext\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"_toAddress\",\"type\":\"address\"}],\"name\":\"readMessage\",\"outputs\":[{\"name\":\"messageInfo\",\"type\":\"bytes32[]\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"}]"
        
        let contractParams = [
            "function": "appendText",
            "Data":userInput
            ] as [AnyHashable:Any]
        
        let txParams = [
            "from": user1_Pub,
            "nonce": BigUInt.init(0),
            "to": contractAddress,
            "value": BigUInt.init(0),
            "gasLimit": BigUInt.init(2000000),
            "gasPrice": BigUInt.init(1000000000),
            "data": [
                "abi": functionABI,
                "params": contractParams
                ] as [AnyHashable: Any]
            ] as [AnyHashable: Any]
        
        do {
            //let transaction = try? PocketEth.createTransaction(wallet: nil, params: txParams)
            
            //Pocket.shared.sendTransaction(transaction: transaction, handler: nil)
            
            
        }catch {
           print("error")
        }
        
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

extension MessageVC: MessagesLayoutDelegate {
    

    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
}


extension MessageVC: MessagesDisplayDelegate {
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
       
    }
}

extension MessageVC: MessagesDataSource {
    
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

extension MessageVC: MessageInputBarDelegate {
    func messageInputBar( _ inputBar: MessageInputBar, didPressSendButtonWith text: String) {

        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        
        let textMessage = userInput

        sendtoContract(userInput: text)
        
        //messages.append(textMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}
