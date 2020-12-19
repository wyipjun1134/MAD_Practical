//
//  Friend.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 26/11/20.
//

class Friend {
    var Name:String
    var profileImageName:String
    var lastMessage:Message?
    var Messages:Message?
    
    init(name:String, profileimagename:String, lastmessage:Message, messages:Message){
        Name = name;
        profileImageName = profileimagename;
        lastMessage = lastmessage;
        Messages = messages;
    }
}
