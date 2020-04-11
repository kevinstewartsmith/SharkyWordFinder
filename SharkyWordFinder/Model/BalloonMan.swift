//
//  BalloonMan.swift
//  AstroHangman
//
//  Created by Kevin Smith on 3/22/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation
import UIKit

class BalloonMan {
    
    var screenWidth : CGFloat?
    var screenHeight : CGFloat?
    var balloonManOrigin : CGPoint?
    var balloonMan : UIImageView
    let screenWidthConstant : CGFloat
    init(screenWidth: CGFloat, screenHeight: CGFloat, balloonMan: UIImageView) {
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.balloonMan = balloonMan
        self.screenWidthConstant = screenWidth
        print("Screen width: \(screenWidth)")
        balloonMan.frame.origin.x = 0
        balloonMan.frame.origin.y = -10
    }
    
    func balloonManResets(_ imageView: UIImageView,_ speed:CGFloat){
            
            let speeds = speed
        let imageSpeed = speeds / (screenWidth ?? 500)
        let averageSpeed = ((screenWidth ?? 500) - imageView.frame.origin.y) * imageSpeed
            
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {imageView.frame.origin = self.balloonManOrigin ?? CGPoint(x: 0, y: 0)
                }, completion: {
                    
                    (_) in imageView.frame.origin = self.balloonManOrigin ?? CGPoint(x: 0, y: 0)
                    print("Origin Y: \(imageView.frame.origin.y)")
            //self.moveIt(imageView,speeds)
                    
                    
                    //self.sharkFlips()
            })
    
            
            
        }
    
    func balloonManFlies(_ imageView: UIImageView,_ speed:CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / (screenWidth ?? 500)
        let averageSpeed = ((screenWidth ?? 500) - imageView.frame.origin.x) * imageSpeed
        imageView.frame.origin.x = 0
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: { self.animate(imageView: self.balloonMan)//self.bloodyShark.frame.origin.x = +self.view.frame.size.width
            }, completion: {
                
                (_) in imageView.frame.origin.x = 100
                //print("Origin: \(imageView.frame.origin.x)")
        //self.moveIt(imageView,speeds)
                
                //self.balloonManFlies(imageView, 7)
                //self.sharkFlips()
                self.balloonManFliesBack(self.balloonMan, 3)
        })
        
        
    }
    
    
    
    func balloonManFliesBack(_ imageView: UIImageView,_ speed:CGFloat){
        let speeds = speed
        let imageSpeed = speeds / (screenWidth ?? 500)
        let averageSpeed = ((screenWidth ?? 500) - imageView.frame.origin.x) * imageSpeed
        imageView.frame.origin.x = (screenWidth ?? 500) - 100
        
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {imageView.frame.origin.x = 0
            }, completion: {
                
                (_) in imageView.frame.origin.x =  0
        //self.moveIt(imageView,speeds)
                //self.sharkFlips()
                self.balloonManFlies(self.balloonMan, 3)
        })
    }
    
    func animate(imageView: UIImageView){
        
        imageView.frame.origin.x = (screenWidth ?? 500) - 100
        //self.bloodyShark.frame.origin.x = -self.view.frame.size.width
        //sharkFlips()
        
    }
    
    func screenGoesLandscape(){
        screenWidth = screenHeight
    }
    func screenGoesPortrait(){
        screenWidth = screenWidthConstant
    }
    
}
