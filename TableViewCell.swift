//
//  TableViewCell.swift
//  JSON on complicated example
//
//  Created by Ammy Pandey on 24/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var actorImg: UIImageView!

    @IBOutlet weak var actorName: UILabel!
   
    @IBOutlet weak var actorCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
