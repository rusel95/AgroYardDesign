//
//  ViewController.swift
//  AgroYardDesign
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var defaultDataToTop = CGFloat(290)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageTopToContainer: NSLayoutConstraint!
   
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var dataToTop: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        setImageView()
        setScrollView()
    }
    
    func setScrollView() {
        scrollView.contentSize = contentView.bounds.size
    }

    func setImageView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        profileImageView.addGestureRecognizer(gestureRecognizer)
        profileImageView.isUserInteractionEnabled = true
        
    }

    func tap() {
        var neededConstant = CGFloat()
        if dataToTop.constant == defaultDataToTop {
            neededConstant = profileImageView.frame.height
        } else {
            neededConstant = defaultDataToTop
        }

        UIView.animate(withDuration: 0.5, animations: {
            self.dataToTop.constant = neededConstant
            self.view.layoutIfNeeded()
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = scrollView.contentOffset.y
        if currentPosition < 0 {
            profileImageTopToContainer.constant = currentPosition
        } else if currentPosition > 0 {
                profileImageTopToContainer.constant = currentPosition / 2.0
        }
        print(currentPosition)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > 120 {
            scrollView.contentOffset.y = 120
        }
    }

}

