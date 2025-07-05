//
//  ProgramTableViewCell.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var programImageView: UIImageView!
    
    static let identifier = "ProgramTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
        let colorTop = UIColor.primary.cgColor
        let colorBottom = UIColor.secondary.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorBottom]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.bounds = containerView.bounds
        gradientLayer.cornerRadius = 8
        containerView.layer.insertSublayer(gradientLayer, at: 0)
        containerView.clipsToBounds = true
        titleLabel.font = UIFont.style(.h1)
        durationLabel.font = UIFont.style(.caption)
        caloriesLabel.font = UIFont.style(.caption)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withProgram program:Program) {
        titleLabel.text = program.title
        durationLabel.text = "\(program.duration) mins"
        caloriesLabel.text = "\(program.calories) cal"
        programImageView.image = UIImage(named: program.image)!
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 8
    }
}
