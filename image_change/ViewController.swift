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
    //戻るボタン
    @IBOutlet weak var prevButton: UIButton!
    //進むボタン
    @IBOutlet weak var nextButton: UIButton!
    
    //画像を表示するUIImageView
    @IBOutlet weak var imageView: UIImageView!
    //画像の配列
    var imageList = ["img_1_s.jpg", "img_2_s.jpg", "img_3_s.jpg"]
    //画像の配列の数
    var imageLength = 0
    //画像インデックス
    var imageIndex = 0
    //タイマー
    var timer: NSTimer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let image = UIImage(named: imageList[0])
        imageView.image = image
        imageLength = imageList.count
        
    }
    
    func timerInitialized(){
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
    }
    
    func onTimer(timer: NSTimer){
        imageIndex = indexChange(1, index: imageIndex, length: imageLength)
        displayImage(imageIndex)
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
    
    func displayImage(index:Int){
        let name = imageList[index]
        let image = UIImage(named: name)
        imageView.image = image
        
    }
    
    func indexChange(num:Int, index:Int, length:Int) -> Int {
        return (index + num + length) % length
    }
    
    //再生ボタン押下時のイベント
    @IBAction func tappedButton(sender: AnyObject) {
        if(timer == nil || !(timer!.valid)){ //停止中または初回再生ボタン押下ならば再生
            timerInitialized()
            startButton.setTitle("停止", forState: UIControlState.Normal)
        }else{   //再生中ならば停止
            timer!.invalidate()
            startButton.setTitle("再生", forState: UIControlState.Normal)
        }
    }
    
    //戻るボタン押下時のイベント
    @IBAction func tappedPrevButton(sender: AnyObject) {
        
    }
    
    //進むボタン押下時のイベント
    @IBAction func tappedNextButton(sender: AnyObject) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
    }


}

