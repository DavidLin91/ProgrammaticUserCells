//
//  UserCell.swift
//  ProgrammaticUserCells
//
//  Created by David Lin on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    func configureCell(user: User) {
        userName.text = "\(user.name.first) \(user.name.last)"
        
        ImageClient.getImage(urlString: user.picture.large) { (result) in
            switch result {
            case .failure:
                break
            case .success(let user):
                DispatchQueue.main.async {
                    self.userPhoto.image = user
                }
            }
        }
        
        
    }

    

    
    
}
