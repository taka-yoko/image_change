//
//  ViewController.swift
//  image_change
//
//  Created by tyoko on 2016/08/27.
//  Copyright © 2016年 takayoshi.yokoyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //再生ボタン
    @IBOutlet weak var startButton: UIButton!
    
    //画像を表示するUIImageView
    @IBOutlet weak var imageView: UIImageView!
    //画像の配列
    var imageList = ["img_1_s.jpg", "img_2_s.jpg", "img_3_s.jpg"]
    //画像インデックス
    var imageIndex = 0
    //タイマー
    var timer: NSTimer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let image = UIImage(named: imageList[0])
        imageView.image = image
        
    }
    
    func timerInitialized(){
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
    }
    
    func onTimer(timer: NSTimer){
        let cnt = imageList.count
        imageIndex = (imageIndex + 1 + cnt) % cnt
        
        displayImage()
    }
    
    func timerStart(){
        if(timer!.valid){
            timerInitialized()
        }
    }
    
    func timerStop(){
        if(timer!.valid){
            timer?.invalidate()
        }
    }
    
    func displayImage(){
        let name = imageList[imageIndex]
        let image = UIImage(named: name)
        imageView.image = image
        
    }
    
    @IBAction func tappedButton(sender: AnyObject) {
        if(timer == nil || !(timer!.valid)){ //停止中または初回再生ボタン押下ならば再生
            timerInitialized()
            startButton.setTitle("停止", forState: UIControlState.Normal)
        }else{   //再生中ならば停止
            timer!.invalidate()
            startButton.setTitle("再生", forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
    }


}

