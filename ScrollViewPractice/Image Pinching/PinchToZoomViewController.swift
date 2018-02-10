//
//  PinchToZoomViewController.swift
//  ScrollViewPractice
//
//  Created by Eduardo Carrillo on 1/7/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class PinchToZoomViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.25
        scrollView.maximumZoomScale =   10
        
        let image = UIImage(named: "trump")
        imageView = UIImageView(image: image)
        
        
        scrollView.contentSize = image!.size
        scrollView.addSubview(imageView)
        scrollView.zoomScale = 5
        
      
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

  

}
