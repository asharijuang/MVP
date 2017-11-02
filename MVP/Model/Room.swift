//
//  Room.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

struct Room {
    var name    : String    = ""
    var message : String    = ""
}

// Access by View
struct RoomViewData {
    var name    : String    = ""
    var message : String    = ""
    var unread  : Bool      = true
}
