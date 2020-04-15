//
//  ViewController.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import UIKit
import CoreGraphics
import CoreImage



class ViewController: UIViewController {
    

    var getScreenWidth : CGFloat?
    var getScreenHeight : CGFloat?
    var balloonManController: BalloonMan?
    var theShark = Shark()
    var openingViewController: OpeningViewController?
    var numberOfGuessesLeft : Int = 0
    var playerViewData = ""
    var ballonManOrigin : CGPoint?
    var dataModel = DataModel()
    var model = Model()
    var secretWord : String?
    var startingGuesses : Int?
    
    @IBOutlet weak var sharkImage: UIImageView!
    @IBOutlet weak var playerView: UILabel!
    @IBOutlet weak var numGuessesLeft: UILabel!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var water: UIImageView!
    
    @IBOutlet weak var bloodyShark: UIImageView!
    @IBOutlet weak var fukkYoo: UIImageView!
    @IBOutlet weak var balloonMan: UIImageView!
    @IBAction func letterButtonPressed(_ sender: UIButton) {
                var guess = model.guess(letter: String(sender.titleLabel?.text?.lowercased() ?? "AA"))
        
        if model.guessIsCorrect == true {
            sharkImage.image = UIImage(named: "lowerWater2.png")
        } else {
            balloonManDrops(balloonMan, 2)
        }
        
        playerView.text = guess
        
        processGueses()
        sender.rotate360Degrees()
    }
    
    


    
   
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        balloonManController?.balloonManResets(balloonMan, 2)
        //balloonManDrops(balloonMan, 2)
        //self.sharkSwims()
        bloodyShark.stopAnimating()
        sharkImage.image = UIImage(named: "lowerWater2.png")
        openingViewController?.onUserAction(data: "The quick brown fox jumps over the lazy dog")
        
        self.resetBoard()

        self.sharkMovesLeft()
    }
    func sharkSwims() {
        var bloodySharkX = bloodyShark.frame.origin.x
        var bloodySharkY = bloodyShark.frame.origin.y
        
        bloodySharkX = bloodySharkX - 100
        
        
        bloodyShark.frame = CGRect(x: bloodySharkX, y: bloodySharkY, width: bloodyShark.frame.size.width, height: bloodyShark.frame.size.height)

        
    }

    func processGueses() {
        if model.takeAwayGuess == true {
            numberOfGuessesLeft -= 1
        }
        
        numGuessesLeft.text = String(numberOfGuessesLeft)
        if numberOfGuessesLeft == 0 {
            print("You dies!")
            
            self.numGuessesLeft.text = "Fuck yoo!"
            self.numGuessesLeft.font = numGuessesLeft.font.withSize(20)
            //guessButton.isEnabled = false
            playerView.text = model.word
            playerView.textColor = UIColor.red
        }
        var bool = false
        if model.revealedLetters == model.getSecretWord().count {
            //guessButton.isEnabled == false
            outcomeLabel.text = "WINNER!!!"
            print("WINNER WINNER Chicken Dinner!!!!!!")
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        self.sharkMovesLeft()
        getScreenWidth = view.frame.size.width
        getScreenHeight = view.frame.size.height
        balloonManController = BalloonMan(screenWidth: getScreenWidth ?? 500,screenHeight: getScreenHeight ?? 500, balloonMan: balloonMan)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)

        ballonManOrigin = balloonMan.frame.origin
        self.resetBoard()

        sharkImage.transform = CGAffineTransform(scaleX: 2, y: 2)
        
//        bloodyShark.animationImages = [
//            UIImage(named: "shark")!,
//            UIImage(named: "flippedShark")!,
//            
//        ]
        print("view did load")
        
        water.frame.origin.y = 200

        
        
    }
    func resetBoard(){
            numberOfGuessesLeft = 9
            numGuessesLeft.text = String(numberOfGuessesLeft)
            numGuessesLeft.font = numGuessesLeft.font.withSize(25)

            var randomWord = model.selectRandomWord()
            model.set(word: randomWord)
            let blankArray = model.makeNewBlankArrayFromWord(word: randomWord)
            print("blankArray--  : \(blankArray)")
            let wordArray = model.makeWordCharArray(word: randomWord)
            print("wordArray:-- \(wordArray)")
            print("getwordArray:-- \(model.getWordCharArray())")
            model.revealedLetters = 0
            let blankWord = model.getBlankWord()
            playerView.text = blankWord
            outcomeLabel.text = ""
    }
    func sayFukkYoo() {
        fukkYoo.frame = CGRect(x: 20, y: 20, width: self.fukkYoo.frame.width * 0.5, height: fukkYoo.frame.width * 0.5)
        fukkYoo.image = UIImage(named: "fukkyoo")
    }

    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            sharkImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            balloonManController?.screenGoesLandscape()
        }

        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            sharkImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            balloonManController?.screenGoesPortrait()
        }
    }
    
    func sharkMovesLeft(){
        UIView.animate(withDuration: 0.5, animations: {
            self.bloodyShark.frame.origin.x -= 70}, completion: nil)
            self.bloodyShark.animationRepeatCount = 5
    
        sharkMoves(forHowLong: 1, xChange: 50, yChange: 0)
        sharkMoves(forHowLong: 1, xChange: -50, yChange: 0)
        
    }
    override func viewDidAppear(_ animated: Bool) {

        moveIt(bloodyShark, 2)

        balloonManController?.balloonManFlies(balloonMan, 3)
        UIView.animate(withDuration: 3, animations: self.sayFukkYoo)
        UIView.animate(withDuration: 3, animations:  {self.water.frame.origin.y =  self.view.frame.size.width - 400},
                       completion:{(_) in self.water.frame.origin.x = self.water.frame.size.height - 400
                                   print("Origin: \(self.bloodyShark.frame.origin.x)")

                                   self.water.frame.origin.y =  self.view.frame.size.height - 400
                                   
    })
        
        
    }
    
    func sharkMoves(forHowLong: CGFloat, xChange: CGFloat, yChange: CGFloat){
        UIView.animate(withDuration: TimeInterval(forHowLong), animations: {
        
        self.bloodyShark.frame.origin.x = self.bloodyShark.frame.origin.x + xChange}, completion: nil)
       
        print("shark moves")
    }
    func sharkFlips(){
        var flippedImage = self.bloodyShark.image
        if #available(iOS 10.0, *) {
            flippedImage = bloodyShark.image?.withHorizontallyFlippedOrientation()
        } else {
            // Fallback on earlier versions
        }
        bloodyShark.image = flippedImage
        print("Shark flips")
    }
    var sharkFacesLeft: Bool = false
    func introSharkSwim(){
        UIView.animate(withDuration: TimeInterval(1), animations: {
        //self.bloodyShark.image = self.bloodyShark.image?.withHorizontallyFlippedOrientation()
        self.bloodyShark.frame.origin.x = self.bloodyShark.frame.origin.x + 50}, completion: nil)
        

    }
    
    func lotteryShark(){
        bloodyShark.animationDuration = 5
        bloodyShark.animationRepeatCount = 0
        
        bloodyShark.startAnimating()
        
        bloodyShark.stopAnimating()
        
    }
        
    func animate(){
        sharkFlips()
        self.bloodyShark.frame.origin.x = +self.view.frame.size.width - 200

        
    }
    
    func moveImage(view: UIImageView){
        var toPoint: CGPoint = CGPoint(x: 0, y: 50)
        var fromPoint : CGPoint = CGPoint(x: 0,y :0)

        var movement = CABasicAnimation(keyPath: "movement")
        movement.isAdditive = true
        movement.fromValue =  NSValue(cgPoint: fromPoint)
        movement.toValue =  NSValue(cgPoint: toPoint)
        movement.duration = 5

        view.layer.add(movement, forKey: "move")
    }
    
    func moveIt(_ imageView: UIImageView,_ speed:CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: { self.animate()//self.bloodyShark.frame.origin.x = +self.view.frame.size.width
            }, completion: {
                
                (_) in imageView.frame.origin.x = imageView.frame.size.width
                print("Origin: \(self.bloodyShark.frame.origin.x)")
        //self.moveIt(imageView,speeds)
                self.sharkFlips()
                self.sharkMovesBack(self.bloodyShark, 4)
                //self.sharkFlips()
        })
        
        
    }
    
    
    
    func sharkMovesBack(_ imageView: UIImageView,_ speed:CGFloat){
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        print("VC screen width\(view.frame.size.width)")
        let averageSpeed = (view.frame.size.width - bloodyShark.frame.origin.x) * imageSpeed
        self.bloodyShark.frame.origin.x = self.view.frame.size.width - 200
        
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {self.bloodyShark.frame.origin.x = -100
            }, completion: {
                
                (_) in self.bloodyShark.frame.origin.x =  -100

                self.moveIt(self.bloodyShark, 2)
        })
    }
    
    func balloonManDrops(_ imageView: UIImageView,_ speed:CGFloat){
            
            let speeds = speed
            let imageSpeed = speeds / view.frame.size.height
            let averageSpeed = (view.frame.size.height - imageView.frame.origin.y) * imageSpeed
            
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {imageView.frame.origin.y = imageView.frame.origin.y + 30
                }, completion: {
                    
                    (_) in imageView.frame.origin.y = imageView.frame.origin.y 
                    print("Origin Y: \(imageView.frame.origin.y)")

            })
    
            
            
        }
    

    
    
    
}

