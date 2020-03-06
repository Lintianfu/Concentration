//
//  Concentration.swift
//  Concentration
//
//  Created by Mr.TF on 2020/3/5.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import Foundation
class Concentration
{
    var cards=[Card]()
    var score:Int=0
    var indexOfOneAndOnlyFaceUpCard:Int?
    func chooseCard(at index:Int) {
        if !cards[index].isMatch
        {
            
            if let matchIndex=indexOfOneAndOnlyFaceUpCard,matchIndex != index //匹配的时候
            {
                if cards[matchIndex].identifiter == cards[index].identifiter
                {
                    cards[index].isMatch=true
                    cards[matchIndex].isMatch=true
                    score+=1
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=nil
                
            }else //不匹配的时候
            {
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp=false
                }
                cards[index].isFaceUp=true
                indexOfOneAndOnlyFaceUpCard=index
            }
        }
    }
     init(numberOfPairsOfCards:Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card=Card()
            self.cards+=[card,card]//也是直接复制添加
        }
    }
}
