//
//  Concentration.swift
//  Concentration
//
//  Created by 박시현 on 2022/01/07.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? // 뒤집혀진 카드의 숫자를 Tracking, 어떤 카드도 뒤집혀 있지 않은 상태(== nil)
                                            // 를 위해 옵셔널을 타입으로
    
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            //matchIndex에 뒤집혀진 카드의 index 값을 넣고, 뒤집힌 카드가 동일한 카드임을 방지하기 위한 과정
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
             } else {
                // either no cards of 2 cards are face up
                 // 모든 카드를 뒤집는다
                 for flipDownIndex in cards.indices {
                     cards[flipDownIndex].isFaceUp = false
                 }
                 // 사용자가 선택한 값은 true로,indexOfOneAndOnlyFaceUpCard에 사용자가 선택한 index라는 매개변수로 identifier 값을 할당
                 cards[index].isFaceUp = true
                 indexOfOneAndOnlyFaceUpCard = index
            }
        }
        }
 
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
        }
        // TODO: Shuffle the cards
        
    }
    
}
