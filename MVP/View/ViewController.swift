//
//  ViewController.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let chatPresenter : ChatPresenter = ChatPresenter(roomService: RoomService())
    var roomToDisplay : [RoomViewData] = [RoomViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.chatPresenter.attachView(view: self)
        self.chatPresenter.getRooms()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : ChatView {
    func startLoading() {
        //
        self.tableView.isHidden = true
    }
    
    func finishLoading() {
        //
        self.tableView.isHidden = false
    }
    
    func setRoom(rooms: [RoomViewData]) {
        roomToDisplay = rooms
        self.tableView.reloadData()
    }
    
    func setEmptyRooms() {
        //
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomToDisplay.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatCell
        let data = self.roomToDisplay[indexPath.row]
        cell.labelName.text      = data.name
        cell.labelMessage.text   = data.message
        cell.setUnread(value: data.unread)
        return cell
    }
}

