//
//  DownloaderTableViewCell.swift
//  VideoDownloader
//
//  Created by FS K on 14.02.2023.
//

import UIKit

class DownloaderTableViewCell: UITableViewCell {

    @IBOutlet weak var downloadPercentageLabel: UILabel!
    @IBOutlet weak var downloadProgressView: NSLayoutConstraint!
    @IBOutlet weak var videoNameLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
