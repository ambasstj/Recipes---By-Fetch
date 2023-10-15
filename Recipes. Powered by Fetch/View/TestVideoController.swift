//
//  TestVideoController.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/15/23.
//

import Foundation
import AVFoundation
import UIKit

class TestVideoController: UIViewController {
    
    var player : AVPlayer!
    var avPlayerLayer : AVPlayerLayer!
    
    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "My Movie BQ", ofType:"mp4"){
            
            player = AVPlayer(url: URL(fileURLWithPath: path))
            avPlayerLayer = AVPlayerLayer(player: player)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resize
            
            videoView.layer.addSublayer(avPlayerLayer)
           // videoView.addSubview(button)
            //videoView.addSubview(label)
            
            player.addObserver(self, forKeyPath: "status", options: [.new], context: nil)
                
            
        }
        else {
            
            debugPrint("pizazz.mp4 not found  \(FileManager.default.currentDirectoryPath)")
            print("video not found")
            return
            
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           if keyPath == "status" {
               if player.status == .readyToPlay {
                   player.play()
               } else if player.status == .failed {
                  print("video not ready")
               }
               else{
                   print("video is in limbo")
               }
           }
       }

       deinit {
           // Remove the observer when the view controller is deallocated
           player.removeObserver(self, forKeyPath: "status")
       }
   }

