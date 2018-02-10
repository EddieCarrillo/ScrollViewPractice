//
//  TwitterProfileViewController.swift
//  ScrollViewPractice
//
//  Created by Eduardo Carrillo on 1/7/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class TwitterProfileViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundProfilePicture: UIImageView!
    
    @IBOutlet weak var sectionHeaderView: UIView!
    
    @IBOutlet weak var profileDescriptionView: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var backgroundTop: NSLayoutConstraint!
    
    var maxHeight: CGFloat = 0
    var lastOffset: CGFloat = 0
    
    
    
    @IBOutlet weak var blurOverlay: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        scrollView.delegate = self
        maxHeight = backgroundProfilePicture.frame.size.height
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.extraLight))
        

    }
    
    func setupNavBar(){
        navBar.setBackgroundImage(UIImage(), for: .default)
    navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
    
    
    
    

}


extension TwitterProfileViewController: UIScrollViewDelegate {
    
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let backgroundHeight = heightConstraint.constant
        if backgroundHeight > maxHeight {
        //    animateHeader()
        }
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let backgroundHeight = heightConstraint.constant
        if backgroundHeight > maxHeight {
         //   animateHeader()
        }
        
    }
    
//   func animateHeader(){
//
//        self.heightConstraint.constant = self.maxHeight
//
//        UIView.animate(withDuration: 0.15) {
//            self.view.layoutIfNeeded()
//        }
//    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let header = backgroundProfilePicture
        
        
        
        var currentYOffset = scrollView.contentOffset.y
        let distance = currentYOffset - lastOffset
        var avatarTransform = CATransform3DIdentity
        var headerTransform = CATransform3DIdentity
        
        
        
        var backgroundHeight: CGFloat = backgroundProfilePicture.bounds.height
        
        let verticalCenterBackground = backgroundHeight / 2
        
        if currentYOffset > verticalCenterBackground {
              backgroundProfilePicture.frame = CGRect(x: 0, y:  scrollView.contentOffset.y - verticalCenterBackground , width: scrollView.bounds.width, height: backgroundHeight)
        }
        
        if currentYOffset < 0 {
            let headerScaleFactor:CGFloat = -(currentYOffset) / header!.bounds.height
            let headerSizevariation = ((header!.bounds.height * (1.0 + headerScaleFactor)) - header!.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
            
            header!.layer.transform = headerTransform
        }
      
        
        
        let backgroundBottomY = backgroundProfilePicture.frame.origin.y + backgroundHeight
        
        let profileDescY = self.profileDescriptionView.frame.origin.y
        let profileBottom = profileDescY + self.profileDescriptionView.frame.height
        
        
        //Make the section header sticky
        if profileBottom <= backgroundBottomY {
            sectionHeaderView.frame = CGRect(x: 0, y: backgroundBottomY, width: sectionHeaderView.bounds.width, height: sectionHeaderView.bounds.height)
        }else {
            sectionHeaderView.frame = CGRect(x: 0, y: profileBottom, width: sectionHeaderView.bounds.width, height: sectionHeaderView.bounds.height)
        }
        
        
        
      
    }
    
    
    


}

