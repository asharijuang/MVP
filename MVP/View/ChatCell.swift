//
//  ChatCell.swift
//  MVP
//
//  Created by asharijuang on 11/2/17.
//  Copyright © 2017 qiscus. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUnread: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUnread(value: Bool) {
        if value {
            self.labelUnread.text = "🔴"
        }else {
            self.labelUnread.text = ""
        }
        
    }

}
