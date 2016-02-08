//
//  InterestService.swift
//  InterestsCollectionViewDemo
//
//  Created by Parker Rushton on 2/5/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit

protocol InterestNetworkAccess {
    
    func getInterests(completion:(json: JSONObject?) -> Void)

}
struct InterestNetworkAPIAccess {
    
    func getInterests(completion:(json: JSONObject?) -> Void) {

    }
    
}

struct InterestService {
    
    var networkAccess = InterestNetworkAPIAccess()
    func getInterests(completion:(interests: [Interest]?) -> Void) {
//        networkAccess.getInterests { (json) -> Void in
//            guard let json = json else { preconditionFailure() }
//            // JSONObject parsing
//        }
        let basketballInterest = Interest(title: "Basketball", iconImage: UIImage(named: "basketball"))
        let cyclingInterest = Interest(title: "Cycling", iconImage: UIImage(named: "cycling"))
        let skiingInterest = Interest(title: "Skiing", iconImage: UIImage(named: "skiing"))
        let soccerInterest = Interest(title: "Soccer", iconImage: UIImage(named: "soccer"))
        let swimmingInterest = Interest(title: "Swimming", iconImage: UIImage(named: "swimming"))
        let tennisInterest = Interest(title: "Tennis", iconImage: UIImage(named: "tennis"))
        let yogaInterest = Interest(title: "Yoga", iconImage: UIImage(named: "yoga"))

        let interests = [basketballInterest, cyclingInterest, skiingInterest, soccerInterest, swimmingInterest, tennisInterest, yogaInterest]

        completion(interests: interests)
    }
}