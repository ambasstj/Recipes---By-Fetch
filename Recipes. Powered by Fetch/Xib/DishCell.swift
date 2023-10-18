//
//  DishCell.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/14/23.
//

import UIKit
import AVFoundation
import Kingfisher

class DishCell: UITableViewCell {
    
    @IBOutlet weak var desertImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        desertImage.layer.cornerRadius = 20
    }
}
    
    
    
    
    
    
   //Remove the image views from  sparkleView before you get started here.  I want a small cutesy video to play on either side of the dessertImage, but no matter what I can only get the audio to play. I've used this same code successfully on a previous app with a build target of 13.0. That app still works perfectly fine. I tried to created a new, minimal project with only one view controller that showed a video and it seems that either this AVplayer function is now deprecated (with no warning) or maybe just doesn't work with this latest version of xcode. Either way. I'll revisit this after I get all the functionality going.
    
   /* override func awakeFromNib() {
        super.awakeFromNib()
        
        if let path = Bundle.main.path(forResource: "pizazz", ofType:"mp4"){
            
            player = AVPlayer(url: URL(fileURLWithPath: path))
            avPlayerLayer = AVPlayerLayer(player: player)
            avPlayerLayer.videoGravity = AVLayerVideoGravity.resize
            
            sparkleVideo.layer.addSublayer(avPlayerLayer)
            sparkleVideo2.layer.addSublayer(avPlayerLayer)
            
            player.play()
        }
        else {
            
            debugPrint("pizazz.mp4 not found  \(FileManager.default.currentDirectoryPath)")
            print("video not found")
            return
            
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }}*/
