//
//  TodoTableViewCell.swift
//  ToDoApp
//
//  Created by Shreeram Bhat on 31/08/23.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, description: String) {
        self.titleLabel.text = title
        if let url = URL(string: description) {
            self.descriptionImageView.isHidden = false
            self.descriptionImageView.downLoadFrom(url: url)
        } else {
            self.descriptionImageView.isHidden = true
            self.descriptionImageView.image = nil
        }
        self.descriptionLabel.text = description
        
    }
    
    @IBAction func didTapOnSelectButton(_ sender: UIButton) {
    }

}
