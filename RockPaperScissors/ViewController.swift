//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Alua Sayabayeva on 2023-02-22.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    var timer = Timer()
    let END_TIME = 3.0
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var winCount: UILabel!
    @IBOutlet weak var loseCount: UILabel!
    @IBOutlet weak var tieCount: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func myChoiceButton(_ sender: UIButton) {
        var myChoice = 0
        if sender.currentTitle == "rock" {
            rockButton.alpha = 1.0
            paperButton.alpha = 0.7
            scissorsButton.alpha = 0.7
            myChoice = 1
        } else if sender.currentTitle == "paper" {
            rockButton.alpha = 0.7
            paperButton.alpha = 1.0
            scissorsButton.alpha = 0.7
            myChoice = 2
        } else if sender.currentTitle == "scissors" {
            rockButton.alpha = 0.7
            paperButton.alpha = 0.7
            scissorsButton.alpha = 1.0
            myChoice = 3
        }
        let enemyChoice = Int.random(in: 1...3)
        if enemyChoice == 1 {
            enemyImageView.image = UIImage(named: "rock.png")
        } else if enemyChoice == 2 {
            enemyImageView.image = UIImage(named: "paper.png")
        } else if enemyChoice == 3 {
            enemyImageView.image = UIImage(named: "scissors.png")
        }
        determineWinner(myChoice: myChoice, enemyChoice: enemyChoice)
    }
    func determineWinner(myChoice: Int, enemyChoice: Int){
        var result = "tieCat"
        switch myChoice {
        case 1:
            if enemyChoice == 1 {
                if let newCount = tieCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    tieCount.text = String(newCountInt)
                    result = "tieCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 2 {
                if let newCount = loseCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    loseCount.text = String(newCountInt)
                    result = "loseCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 3 {
                if let newCount = winCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    winCount.text = String(newCountInt)
                    result = "winCat"
                } else{
                    print("Not Worked")
                }
            }
            
        case 2:
            if enemyChoice == 1 {
                if let newCount = winCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    winCount.text = String(newCountInt)
                    result = "winCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 2 {
                if let newCount = tieCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    tieCount.text = String(newCountInt)
                    result = "tieCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 3 {
                if let newCount = loseCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    loseCount.text = String(newCountInt)
                    result = "loseCat"
                } else{
                    print("Not Worked")
                }
            }
        case 3:
            if enemyChoice == 1 {
                if let newCount = loseCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    loseCount.text = String(newCountInt)
                    result = "loseCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 2 {
                if let newCount = winCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    winCount.text = String(newCountInt)
                    result = "winCat"
                } else{
                    print("Not Worked")
                }
            } else if enemyChoice == 3 {
                if let newCount = tieCount.text, var newCountInt = Int(newCount){
                    newCountInt+=1
                    tieCount.text = String(newCountInt)
                    result = "tieCat"
                } else{
                    print("Not Worked")
                }
            }
        default:
            if let newCount = tieCount.text, var newCountInt = Int(newCount){
                newCountInt+=1
                tieCount.text = String(newCountInt)
                
            } else{
                print("Not Worked")
            }
        }
        
        if result == "tieCat" {
            resultLabel.text = "Tie - Don't give paws up!"
        } else if result == "winCat" {
            resultLabel.text = "Win - You are meowsome"
        } else if result == "loseCat" {
            resultLabel.text = "Lose - You are meowsireble"
        }
        
        let url = Bundle.main.url(forResource: result, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target:self, selector: #selector(stop), userInfo:nil, repeats: true)
        
    }
    
    @objc func stop() {
        if player.currentTime >= END_TIME {
            player.stop()
            timer.invalidate()
        }
    }
}

