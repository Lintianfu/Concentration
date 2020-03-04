//
//  ViewController.swift
//  Concentration
//
//  Created by Mr.TF on 2020/3/4.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var CardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount:Int=0
       {
           didSet
           {
               flipCountLabel.text="FlipCount:\(flipCount)"
           }
       }
    var emojis=["🦊","🙈","🐮","🦊","🙈","🐮"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
             if let cardNumber=CardButtons.firstIndex(of:sender)
             {
                   flipCard(withEmoji: emojis[cardNumber], on: sender)
             }else
             {
                    print("show error")
                    print("4444")
                    print("6666")
             }
    }
    func flipCard(withEmoji emoji:String,on button:UIButton) -> Void {
        if button.currentTitle==emoji
        {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
       
    }
    
}

