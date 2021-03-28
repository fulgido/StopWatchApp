//
//  PlayerTableViewCell.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCellStyle()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//      TODO
    }
    
    func setupCellStyle() {
        playerImage.layer.borderWidth = 1.0
        playerImage.layer.masksToBounds = false
        playerImage.layer.borderColor = UIColor.black.cgColor
        playerImage.layer.cornerRadius = playerImage.frame.size.width/2
        playerImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
