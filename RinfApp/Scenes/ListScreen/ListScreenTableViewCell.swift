//
//  ListScreenTableViewCell.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit


class ListScreenTableViewCell: UITableViewCell {
    
    
    // MARK: IBOutlet/IBAction
    
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placeCoordonates: UILabel!
    
    // MARK: Cell Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
