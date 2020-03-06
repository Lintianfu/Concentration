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
    var flipCount:Int=0
       {
           didSet
           {
            flipCountLabel.text="FlipCount:\(game.score)"
           }
       }
    var emojis=["🦊","🙈","🐮","🐰","🐶","🦁","🐨","🦉","🐴"]
    var emoji=[Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCard(_ sender: UIButton) {
             if let cardNumber=CardButtons.firstIndex(of:sender)
             {
                game.chooseCard(at: cardNumber)
                updateViewFormModel()
             }else
             {
                    print("show error")
             }
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
    
    func emoji(for card:Card) -> String {
        if emoji[card.identifiter] == nil,emojis.count>0{
           let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
           emoji[card.identifiter] = emojis.remove(at: randomIndex)
    }
        return emoji[card.identifiter] ?? "?"
}
}
