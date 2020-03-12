//
//  ViewController.swift
//  Concentration
//
//  Created by Mr.TF on 2020/3/4.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //lazy 懒加载
    lazy var game:Concentration=Concentration(numberOfPairsOfCards:(CardButtons.count+1)/2)
    @IBOutlet var CardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    {
        didSet
        {
            updateflipCountLabel()
        }
    }
    var flipCount:Int=0
       {
           didSet
           {
            updateflipCountLabel()
           }
       }
    var emojis=["🦊","🙈","🐮","🐰","🐶","🦁","🐨","🦉","🐴"]
    var emoji=[Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue:"isTest"), object: nil)
        
    }

    @IBAction func touchCard(_ sender: UIButton) {
             if let cardNumber=CardButtons.firstIndex(of:sender)
             {
                flipCount+=1
                game.chooseCard(at: cardNumber)
                updateViewFormModel()
               // print(String(game.indexOfOneAndOnlyFaceUpCard!))
             }else
             {
                    print("show error")
             }
    }
    @objc func test(nofi : Notification)
    {
            //updateViewFormModel()
        print("收到更新通知")
    }
     func updateViewFormModel()  {
       
        for index in CardButtons.indices
        {
            let button=CardButtons[index]
            let card=game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor=card.isMatch ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    func updateflipCountLabel()
    {
        let attributes:[NSAttributedString.Key:Any]=[.strokeWidth:5.0,.strokeColor:#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)]
        let attributedString=NSAttributedString(string: "FlipCount:\(game.score)", attributes: attributes)
        flipCountLabel.attributedText=attributedString
        
    }
    
    func emoji(for card:Card) -> String {
        if emoji[card.identifiter] == nil,emojis.count>0{
           let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
           emoji[card.identifiter] = emojis.remove(at: randomIndex)
    }
        return emoji[card.identifiter] ?? "?"
}
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
