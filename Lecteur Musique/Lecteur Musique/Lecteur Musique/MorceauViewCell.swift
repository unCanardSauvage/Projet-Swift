//
//  MorceauViewCell.swift
//  Lecteur Musique
//
//  Created by Armand Audeoud on 28/01/2021.
//

import UIKit

class MorceauViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var artisteLabel: UILabel!
    
}
