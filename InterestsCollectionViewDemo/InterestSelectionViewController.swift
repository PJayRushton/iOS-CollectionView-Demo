//
//  InterestSelectionViewController.swift
//  InterestsCollectionViewDemo
//
//  Created by Parker Rushton on 2/5/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class InterestSelectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    private let margin: CGFloat = 16.0
    private let maxInterests = 3
    
    var interestService = InterestService()
    
    private var interests = [Interest]()
    private var selectedInterests = [Interest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInterests()
        collectionView.allowsMultipleSelection = true
    }
    
}

private extension InterestSelectionViewController {
    
    func loadInterests() {
        interestService.getInterests { interests in
            guard let interests = interests else { return }
            self.interests = interests
        }
    }
    
    func cellCanBeSelected() -> Bool {
        let interestsSelected = collectionView.indexPathsForSelectedItems()!.count
        return interestsSelected < 3
    }
    
    func updateContinueButton() {
        switch selectedInterests.count {
        case 0..<maxInterests:
            let interestsRemaining = 3 - selectedInterests.count
            continueButton.setTitle("Pick \(interestsRemaining)", forState: .Normal)
            continueButton.backgroundColor = .lightGrayColor()
            continueButton.setTitleColor(.darkGrayColor(), forState: .Normal)
            continueButton.enabled = false
        case maxInterests:
            continueButton.setTitle("Continue", forState: .Normal)
            continueButton.backgroundColor = .welbeBlue()
            continueButton.setTitleColor(.whiteColor(), forState: .Normal)
            continueButton.enabled = true
        default:
            break
        }
    }
    
    func modifyInterest(atIndexPath indexPath: NSIndexPath, add: Bool) {
        let interest = interests[indexPath.item]
        if add {
            selectedInterests.append(interest)
        } else if let index = selectedInterests.indexOf(interest) {
            selectedInterests.removeAtIndex(index)
        } else {
            print("Error updating interest")
        }
        updateContinueButton()
    }
    
}

extension InterestSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(InterestCollectionViewCell.reuseIdentifier, forIndexPath: indexPath) as? InterestCollectionViewCell else { preconditionFailure() }
        cell.update(withInterest: interests[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return cellCanBeSelected()
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        modifyInterest(atIndexPath: indexPath, add: true)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        modifyInterest(atIndexPath: indexPath, add: false)
    }
    
    
}

extension InterestSelectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - (margin * 4)) / 3
        
        return CGSizeMake(width, width)
    }
    
}
