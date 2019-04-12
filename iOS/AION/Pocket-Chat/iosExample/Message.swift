//
//  Message.swift
//  iosExample
//
//  Created by jeremy beal on 3/16/19.
//  Copyright © 2019 Pocket_Sample. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

// store the messages you want to display
// create the models that will store our messages
// not really needed, just used to test UI
struct Member {
    let name: String
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
}

extension Message: MessageType {
    var sender: Sender {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        return Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
