//
//  UserDetailVC.swift
//  ProgrammaticUserCells
//
//  Created by David Lin on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserDetailVC: UIViewController {
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    private func updateUI() {
        guard let user = user else {
            fatalError("could not update UI")
        }
        
        
        
        
        
    }
    
    

}
