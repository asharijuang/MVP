//
//  RoomService.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

class RoomService: NSObject {
    func getRooms(completion: @escaping ([Room]) -> Void) {
        let rooms : [Room] = [Room(name: "JuangBot", message: "Hello"), Room(name: "Family", message: "Jangan lupa silaturahmi"), Room(name: "Group Coder", message: "Hello Word")]
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // your code here
            completion(rooms)
        }
    }
}
