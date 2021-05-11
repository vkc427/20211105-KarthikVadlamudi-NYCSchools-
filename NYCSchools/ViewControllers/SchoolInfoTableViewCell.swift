//
//  SchoolInfoTableViewCell.swift
//  NYCSchools
//
//  Created by Karthik Vadlamudi on 5/10/21.
//

import UIKit

class SchoolInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var zip: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var city: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
