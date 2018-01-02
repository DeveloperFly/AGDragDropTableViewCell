//
//  ProfileData.swift
//  AGDragDropTableViewCell
//
//  Created by Aman Gupta on 02/01/18.
//  Copyright © 2018 Developer Fly. All rights reserved.
//

import UIKit

class ProfileData: NSObject {

    var profileImageName = ""
    var name = ""
    var age = ""
    
    func loadTopSampleData() -> [ProfileData] {
        var arrayProfileData = [ProfileData]()
        var arrayName = ["Profile1", "Profile2", "Profile3", "Profile4", "Profile5", "Profile6", "Profile7", "Profile8", "Profile9", "Profile10", "Profile11", "Profile12",]
        var arrayAge = ["age1", "age2", "age3", "age4", "age5", "age6", "age7", "age8", "age9", "age10", "age11", "age12",]
        var arrayProfileImage = ["File1.jpeg", "File2.jpg", "File3.jpeg", "File4.jpg", "File5.jpeg", "File6.jpg", "File7.jpg", "File8.jpeg", "File9.jpeg", "File10.jpeg", "File11.jpg", "File12.jpg"  ]
        
        for (index, _) in arrayName.enumerated() {
            let locProfile = ProfileData()
            locProfile.name = arrayName[index]
            locProfile.age = arrayAge[index]
            locProfile.profileImageName = arrayProfileImage[index]
            arrayProfileData.append(locProfile)
        }
        return arrayProfileData
    }
    
}
