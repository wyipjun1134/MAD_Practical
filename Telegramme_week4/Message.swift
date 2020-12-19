//
//  Friend.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 26/11/20.
//

import UIKit

class Message {
    var date:Date
    var isSender:Bool
    var text:String
    var friend:Friend
    
    
    init(mdate:Date, issender:Bool, mtext:String, mfriend:Friend){
        date = mdate;
        isSender = issender;
        text = mtext;
        friend = mfriend;
    }
}
