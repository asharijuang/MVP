//
//  ChatPresenter.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

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
//
//    func getUsers(){
//        self.userView?.startLoading()
//        userService.getUsers{ [weak self] users in
//            self?.userView?.finishLoading()
//            if(users.count == 0){
//                self?.userView?.setEmptyUsers()
//            }else{
//                let mappedUsers = users.map{
//                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
//                }
//                self?.userView?.setUsers(mappedUsers)
//            }
//
//        }
//    }
}
