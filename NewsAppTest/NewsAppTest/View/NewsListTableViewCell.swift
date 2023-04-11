//
//  NewsListTableViewCell.swift
//  NewsAppTest
//
//  Created by ranjit dhumal on 11/04/23.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newslistImageView: UIImageView!
    
    @IBOutlet weak var newslistLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
