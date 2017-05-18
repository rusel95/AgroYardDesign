//
//  ViewController.swift
//  AgroYardDesign
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var defaultDistanceToTop = CGFloat(180)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
//
//    @IBOutlet weak var ghostView: UIView!
//    @IBOutlet weak var ghostViewTop: NSLayoutConstraint!
//    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewVerticalToImage: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
//        
//        setGhostView()
        setScrollView()
    }
    
    func setScrollView() {
        scrollView.contentSize = contentView.bounds.size
        print(scrollView.contentSize)
    }
//
//    func setGhostView() {
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
//        ghostView.addGestureRecognizer(gestureRecognizer)
//        ghostView.isUserInteractionEnabled = true
//        
////        ghostViewTop.constant = -1000
//    }
//    
//    func tap() {
//        var neededConstant = CGFloat()
//        if dataViewTop.constant == defaultDistanceToTop {
//            neededConstant = self.profileImageView.bounds.size.height
//        } else {
//            neededConstant = defaultDistanceToTop
//        }
//        
//        UIView.animate(withDuration: 0.5, animations: {
//            self.dataViewTop.constant = neededConstant
//            self.view.layoutIfNeeded()
//        })
//        
//        print(scrollView.contentSize)
//    }
//    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        print(scrollView.contentSize)
//    }
    

}

