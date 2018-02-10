//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by Eduardo Carrillo on 1/7/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Add the scroll view to view hierarchy
    @IBOutlet weak var scrollView: UIScrollView!
    var grayView: UIView!
    
    
    
    //Programatically scrolling///////////////////
    @IBAction func upTapped(_ sender: Any) {
        let yScrollDistance = CGFloat(50)
        let newOffset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y - yScrollDistance )
        
        scrollView.setContentOffset(newOffset, animated: true)
    }
    
    
    @IBAction func downTapped(_ sender: Any) {
        let yScrollDistance = CGFloat(50)
        let newOffset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + yScrollDistance )
        
        scrollView.setContentOffset(newOffset, animated: true)
        
    }
    /////////////////////////////////////////////////////
    
    
    //Scrolling to a subview///////////////////////////////
    
    
    
    
    
    ///////////////////////////////////////////////////////
    
    @IBAction func didTapScrollButton(_ sender: Any) {
        scrollView.scrollRectToVisible(grayView.frame, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the scroll view content size
        let contentWidth = scrollView.bounds.width
        let contentHeight = scrollView.bounds.height * 3
        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        
        let subviewHeight = CGFloat(120)
        
        var currentViewOffset = CGFloat(0)
        
        while currentViewOffset < contentHeight {
            let frame = CGRect(x: 0, y: currentViewOffset, width: contentWidth, height: subviewHeight)
            let hue = currentViewOffset / contentHeight
            let subview = UIView(frame: frame)
            subview.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            scrollView.addSubview(subview)
            
            currentViewOffset += subviewHeight
           
        }
        
        
        
        //Add gray subviwe
         grayView = UIView(frame:CGRect(x: 50,y: 620, width: 50, height: 100))
        grayView.backgroundColor = UIColor.gray
        scrollView.addSubview(grayView)
        
    }
    
    
    
    
    
    

   


}

