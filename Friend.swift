//
//  Friend.swift
//  BirthdayApp
//
//  Created by Scholar on 7/11/25.
//

import Foundation
import SwiftData
@Model

class Friend { //Friend is our class
    //These two are our variables
    var name: String
    var birthday: Date
    
    //Thisomot stores our variables.
    init (name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
        //also used for a syntax!
    }
}
