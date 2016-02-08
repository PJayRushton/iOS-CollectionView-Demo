//
//  InterestCollectionViewCell.swift
//  InterestsCollectionViewDemo
//
//  Created by Parker Rushton on 2/5/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "InterestCollectionViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBInspectable var selectedColor: UIColor = .welbeBlue() {
        didSet {
            updateUI()
        }
    }
    @IBInspectable var normalColor: UIColor = .lightGrayColor() {
        didSet {
            updateUI()
        }
    }
    
    
    // MARK: Override funcs
    
    override var selected: Bool {
        didSet {
            updateUI()
        }
    }
    
    
    // MARK: - Main functions
    
    func update(withInterest interest: Interest) {
        titleLabel.text = interest.title
        iconImageView.image = interest.iconImage
        updateUI()
    }
    
}


// MARK: Private funcs

private extension InterestCollectionViewCell {
    
    func updateUI() {
        iconImageView?.tintColor = selected ? selectedColor : normalColor
        titleLabel?.textColor = selected ? selectedColor : normalColor
        layer.borderWidth = 1.0
        layer.borderColor = selected ? selectedColor.CGColor : normalColor.CGColor
        layer.masksToBounds = true
    }
    
}
