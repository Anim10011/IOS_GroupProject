//
//  MemberCell.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class MemberCell: UITableViewCell {
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
