//
//  TopTableViewCell.swift
//  AGDragDropTableViewCell
//
//  Created by Aman Gupta on 29/12/17.
//  Copyright © 2017 Developer Fly. All rights reserved.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewProfile: UIImageView!
    
    //MARK: - Configure Cell Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        self.imageViewProfile.layer.cornerRadius = self.imageViewProfile.frame.width / 2
        self.imageViewProfile.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure Cell Methods
    func configureCell(profile: ProfileData) {
        self.imageViewProfile?.image = UIImage(named: profile.profileImageName)
        self.labelAge.text = profile.age
        self.labelName.text = profile.name
    }

}
