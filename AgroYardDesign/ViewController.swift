//
//  ViewController.swift
//  AgroYardDesign
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaultDistanceToTop = CGFloat(180)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var ghostView: UIView!
    @IBOutlet weak var ghostViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var dataViewTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGhostView()
        setScrollView()
    }
    
    func setScrollView() {
        scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: 100)
    }
    
    func setGhostView() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        ghostView.addGestureRecognizer(gestureRecognizer)
        ghostView.isUserInteractionEnabled = true
        
        //ghostViewTop.constant = -1000
    }
    
    func tap() {
        var neededConstant = CGFloat()
        if dataViewTop.constant == defaultDistanceToTop {
            neededConstant = self.profileImageView.bounds.size.height
        } else {
            neededConstant = defaultDistanceToTop
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dataViewTop.constant = neededConstant
            self.view.layoutIfNeeded()
        })
        
        print(scrollView.contentSize)
    }
    
    
    
}

