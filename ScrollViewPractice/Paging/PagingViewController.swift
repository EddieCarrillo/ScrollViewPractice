//
//  PagingViewController.swift
//  ScrollViewPractice
//
//  Created by Eduardo Carrillo on 1/7/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class PagingViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adding a page control
        scrollView.delegate = self
        pageControl.numberOfPages = 3
        
        
        
        let pageWidth = scrollView.bounds.width
        let pageHeight = scrollView.bounds.height
        
        //3 Horizontal pages
        scrollView.contentSize = CGSize(width: 3*pageWidth, height: pageHeight)
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight))
        view1.backgroundColor = UIColor.red
        
        let view2 = UIView(frame: CGRect(x: pageWidth, y: 0, width: pageWidth, height: pageHeight))
        view2.backgroundColor = UIColor.blue
        
        let view3 = UIView(frame: CGRect(x: 2*pageWidth, y: 0, width: pageWidth, height: pageHeight))
        view3.backgroundColor = UIColor.green
        
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.addSubview(view3)

    }
    
    //Adding a page control
    
    @IBAction func pageControlDidPage(_ sender: Any) {
        //When the page control is updated then the scroll view should be as well
        let xOffset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        //Update the scroll view after changing page control
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Update the page control dots after finished scrolling
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    
    
    
    


}
