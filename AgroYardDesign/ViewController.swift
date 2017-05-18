//
//  ViewController.swift
//  AgroYardDesign
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 rusel95. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var defaultVerticalToImage = CGFloat(-60)
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageTopToContainer: NSLayoutConstraint!
   
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var dataViewVerticalToImage: NSLayoutConstraint!
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
        if dataViewVerticalToImage.constant == defaultVerticalToImage {
            neededConstant = 0
        } else {
            neededConstant = defaultVerticalToImage
        }

        UIView.animate(withDuration: 0.5, animations: {
            self.dataViewVerticalToImage.constant = neededConstant
            self.view.layoutIfNeeded()
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = scrollView.contentOffset.y
        if currentPosition < 0 {
            profileImageTopToContainer.constant = currentPosition
        }
        
        print(currentPosition)
    }

}

