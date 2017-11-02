//
//  ChatPresenter.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

// Protocol to comunicate presenter -> View
protocol ChatView {
    func startLoading()
    func finishLoading()
    func setRoom(rooms: [RoomViewData])
    func setEmptyRooms()
}

class ChatPresenter {
    private let roomService : RoomService
    private var chatView : ChatView?
    
    init(roomService : RoomService) {
        self.roomService = roomService
    }
    
    func attachView(view : ChatView){
        chatView = view
    }
    
    func detachView() {
        chatView = nil
    }
    
    func getRooms() {
        self.chatView?.startLoading()
        
        roomService.getRooms { rooms in
            self.chatView?.finishLoading()
            if rooms.count == 0 {
                self.chatView?.setEmptyRooms()
            }else {
                let mappedRooms = rooms.map({ room in
                    return RoomViewData(name: room.name, message: room.message, unread: true)
                })
                self.chatView?.setRoom(rooms: mappedRooms)
            }
            
        }
    }
}
