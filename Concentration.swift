//
//  Concentration.swift
//  Concentration
//
//  Created by Mr.TF on 2020/3/5.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import Foundation
struct Concentration
{
    var cards=[Card]()
    var score:Int=0
    var indexOfOneAndOnlyFaceUpCard:Int?
    {
        get{
            var foundIndex:Int?
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex==nil{
                        foundIndex=index
                    }
                    else
                    {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp=(index==newValue)
            }
        }
    }
   mutating func chooseCard(at index:Int) {
        if !cards[index].isMatch
        {
            
            if let matchIndex=indexOfOneAndOnlyFaceUpCard,matchIndex != index //匹配的时候
            {
                if cards[matchIndex].identifiter == cards[index].identifiter
                {
                    cards[index].isMatch=true
                    cards[matchIndex].isMatch=true
                    score+=1
                    NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
                }
                cards[index].isFaceUp=true
                
            }else //不匹配的时候
            {
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
