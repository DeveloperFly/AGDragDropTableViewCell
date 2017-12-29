//
//  BottomTableViewCell.swift
//  AGDragDropTableViewCell
//
//  Created by Aman Gupta on 29/12/17.
//  Copyright © 2017 Developer Fly. All rights reserved.
//

import UIKit

class BottomTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewProfile: UIImageView!
    
    //MARK: - Configure Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
