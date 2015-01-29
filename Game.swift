//
//  Game.swift
//  Pong Game
//
//  Created by Dharmesh on 29/10/14.
//  Copyright (c) 2014 Dharmesh. All rights reserved.
//

import UIKit

class Game: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var Computer: UIImageView!
    @IBOutlet weak var Player: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var computerScore: UILabel!
    @IBOutlet weak var WinOrLoose: UILabel!
    @IBOutlet weak var Exit: UIButton!
    
    
    var timer : NSTimer = NSTimer()
    var X : Int = Int()
    var Y : Int = Int()
    var computerScoreNumber : Int = Int()
    var playerScoreNumber : Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerScoreNumber = 0
        computerScoreNumber = 0
        // Do any additional setup after loading the view.
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            Player.center = touch.locationInView(self.view)
            
            if Player.center.y > 525 {
                 Player.center = CGPointMake(Player.center.x, 525)
            }
            if Player.center.y < 525 {
                Player.center = CGPointMake(Player.center.x, 525)
            }
            
            if Player.center.x < 0{
                Player.center = CGPointMake(0, Player.center.y)
            }
            if Player.center.x > 246 {
                Player.center = CGPointMake(246, Player.center.y)
            }
        }
        
//        var drag = event.allTouches()?.anyObject()
//        Player.center = drag.locationInView(self.view)
    }
    
    func collision(){
        
        if CGRectIntersectsRect(ball.frame, Player.frame){
            
            Y = Int(arc4random() % 5)
            Y = 0 - Y
        }
        if CGRectIntersectsRect(ball.frame, Computer.frame){
            
            Y = Int(arc4random() % 5)
            
        }
    }
    
    @IBAction func startButton(sender: AnyObject) {
        
        startButton.hidden = true
        Exit.hidden = true
        
        Y = Int(arc4random() % 11)
        Y = Y - 5
        
        X = Int(arc4random() % 11)
        X = X - 5
        
        if Y == 0 {
            Y = 1
        }
        
        if X == 0 {
            X = 1
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "BallMovement", userInfo: nil, repeats: true)
        
        
    }
    func BallMovement(){
        
        self.computerMovement()
        
        self.collision()
        
        ball.center = CGPointMake(ball.center.x + CGFloat (X), ball.center.y + CGFloat (Y))
        
        if ball.center.x < 15{
            
            X = 0 - X
        }
        
        if ball.center.x > 290{
            
            X = 0 - X
        }
        
        if ball.center.y < 0 {
            
            playerScoreNumber = playerScoreNumber + 1
            playerScore.text = "\(playerScoreNumber)"
            
            timer.invalidate()
            
            startButton.hidden = false
            ball.center = CGPointMake(145, 218)
            
            Computer.center = CGPointMake(124, 20)
            
            if playerScoreNumber == 10 {
                
                startButton.hidden = true
                Exit.hidden = false
                WinOrLoose.hidden = false
                WinOrLoose.text = "You Win!"
            }
        }
        
        if ball.center.y > 567 {
            
            computerScoreNumber  = computerScoreNumber + 1
            computerScore.text = "\(computerScoreNumber)"
            
            timer.invalidate()
            
            startButton.hidden = false
            ball.center = CGPointMake(145, 218)
            
            Computer.center = CGPointMake(124, 20)
            
            if computerScoreNumber == 10 {
                
                startButton.hidden = true
                Exit.hidden = false
                WinOrLoose.hidden = false
                WinOrLoose.text = "You Loose!"
            }
        }
        
    }

    func computerMovement(){
        
        if Computer.center.x > ball.center.x{
            
            Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y)
        
        }
        if Computer.center.x < ball.center.x{
            
            Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y)
        }
        if Computer.center.x < 0 {
            
            Computer.center = CGPointMake(0, Computer.center.y)
        }
        if Computer.center.x > 246 {
            
            Computer.center = CGPointMake(246, Computer.center.y)
        }
    }
}
