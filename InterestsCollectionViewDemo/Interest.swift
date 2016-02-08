//
//  Interest.swift
//  InterestsCollectionViewDemo
//
//  Created by Parker Rushton on 2/5/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit

struct Interest: Equatable {
    
    let title: String
    let iconImage: UIImage?
    
    init(title: String, iconImage: UIImage?) {
        self.title = title
        self.iconImage = iconImage
    }
    
}

extension Interest { }

func ==(lhs: Interest, rhs: Interest) -> Bool {
    return lhs.title == rhs.title
}
