//
//  ShadowButton.swift
//  FitnessApp
//
//  Created by Purnasindhu-749 on 05/07/25.
//


import Foundation
import UIKit

class ShadowButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel?.font = UIFont.style(.buttonTitle)
        backgroundColor = UIColor.primary
        layer.shadowColor = UIColor.secondary.cgColor
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }

}
