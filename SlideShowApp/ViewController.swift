//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 柏崎快音 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet var tapImage: UITapGestureRecognizer!
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var playImage: UIButton!
    @IBOutlet weak var backImage: UIButton!
    
    
    
    var imageRow = [UIImage(named: "IMG_9753"),UIImage(named: "IMG_9711"),UIImage(named: "IMG_9719"),UIImage(named: "IMG_9824")]
    
    var nowIndex:Int = 0
    
    var timer:Timer!
    
    var imageBox:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.black
        firstImage.image = imageRow[nowIndex]
        
    }
    
    
    
    
    @IBAction func nextButtom(_ sender: Any) {
        nowIndex += 1
        
        if nowIndex == 4 {
            nowIndex = 0
        }
        
        firstImage.image = imageRow[nowIndex]
        
    }
    
    @IBAction func backButtom(_ sender: Any) {
        nowIndex -= 1
        
        if nowIndex == -1 {
            nowIndex = 3
        }
        
        firstImage.image = imageRow[nowIndex]
        
    }
    
    
    @IBAction func playButtom(_ sender: Any) {
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextButtom(_:)), userInfo: nil, repeats: true)
            
            let play = UIImage(named: "stop-fill")
            
            playImage.setImage(play, for: .normal)
            
            tapImage.isEnabled = false
            backImage.isHidden = true
            nextImage.isHidden = true
            
        } else {
            timer.invalidate()
            timer = nil
            
            let stopImage = UIImage(named: "play-fill")
            playImage.setImage(stopImage, for: .normal)
            
            tapImage.isEnabled = true
            backImage.isHidden = false
            nextImage.isHidden = false
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let closeUpViewController:CloseUpViewController = segue.destination as! CloseUpViewController
        
        let sentImage: UIImage = firstImage.image!
        closeUpViewController.secondImage = sentImage
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

