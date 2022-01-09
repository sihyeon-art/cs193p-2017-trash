//
//  Card.swift
//  Concentration
//
//  Created by 박시현 on 2022/01/07.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var idendifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        idendifierFactory += 1
        return idendifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
}
