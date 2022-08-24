//
//  CloseUpViewController.swift
//  SlideShowApp
//
//  Created by 柏崎快音 on 2022/08/22.
//

import UIKit

class CloseUpViewController: UIViewController {

    @IBOutlet weak var closeUpImage: UIImageView!
    
    var secondImage : UIImage!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        closeUpImage.image = secondImage
        
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        closeUpImage.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    
    
}
