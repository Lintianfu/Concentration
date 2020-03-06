//
//  Card.swift
//  Concentration
//
//  Created by Mr.TF on 2020/3/5.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

import Foundation
struct Card {
    var isFaceUp=false
    var isMatch=false
    var identifiter:Int
    static var identifiterFactory=0
    
    static func getUniqueIdentifiter()->Int  //静态方法
    {
        Card.identifiterFactory+=1
        
        return Card.identifiterFactory
    }
    init() {
        self.identifiter=Card.getUniqueIdentifiter()
    }
}
