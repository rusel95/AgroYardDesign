//
//  ViewController.swift
//  AgroYardDesign
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var defaultImageHeight = CGFloat(200)
    var defaultDataToTop = CGFloat(160)
    var positionAfterTap = CGFloat(350)
    var minimalOffset = CGFloat(0)
    var maximalOffset = CGFloat(0)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageTopToContainer: NSLayoutConstraint!
    @IBOutlet weak var profileImageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dataToTop: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        setImageView()
        setScrollView()
        setDataView()
        setSwipes()
    }
    
    func setSwipes() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture) )
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture) )
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func setScrollView() {
        scrollView.contentSize = contentView.bounds.size
    }
    
    func setDataView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        dataView.addGestureRecognizer(gestureRecognizer)
        dataView.isUserInteractionEnabled = true
    }
    
    func setImageView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        profileImageView.addGestureRecognizer(gestureRecognizer)
        profileImageView.isUserInteractionEnabled = true
        
    }
    
    func tap() {
        
        var neededConstant = CGFloat()
        var tempProfileImageHeight = CGFloat()
        
        if dataToTop.constant == defaultDataToTop {
            neededConstant = positionAfterTap
            tempProfileImageHeight = positionAfterTap
        } else {
            neededConstant = defaultDataToTop
            tempProfileImageHeight = defaultImageHeight
        }
        
        UIView.animate(withDuration: 1, animations: {
            self.dataToTop.constant = neededConstant
            self.profileImageHeight.constant = tempProfileImageHeight
            self.view.layoutIfNeeded()
        })
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = scrollView.contentOffset.y
        
        if currentPosition < 0 {
            profileImageTopToContainer.constant = currentPosition
            profileImageHeight.constant = defaultImageHeight - currentPosition
        }
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            var neededConstant = CGFloat()
            var tempProfileImageHeight = CGFloat()
            
            UIView.animate(withDuration: 1, animations: {
                self.dataToTop.constant = neededConstant
                self.profileImageHeight.constant = tempProfileImageHeight
                self.view.layoutIfNeeded()
            })
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.down:
                neededConstant = positionAfterTap
                tempProfileImageHeight = positionAfterTap
            case UISwipeGestureRecognizerDirection.up:
                neededConstant = defaultDataToTop
                tempProfileImageHeight = defaultImageHeight
            default:
                break
            }
            
            UIView.animate(withDuration: 1, animations: {
                self.dataToTop.constant = neededConstant
                self.profileImageHeight.constant = tempProfileImageHeight
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

