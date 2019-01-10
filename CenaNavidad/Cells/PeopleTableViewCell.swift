//
//  PeopleTableViewCell.swift
//  CenaNavidad
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 9/1/19.
//  Copyright © 2019 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
