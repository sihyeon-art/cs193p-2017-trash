//
//  Concentration.swift
//  Concentration
//
//  Created by 박시현 on 2022/01/07.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    // 뒤집혀진 카드의 숫자를 Tracking, 어떤 카드도 뒤집혀 있지 않은 상태(== nil)를 위해 옵셔널을 타입으로
   private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
            
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    
    
    
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): choosen index not in the cards")
        if !cards[index].isMatched {
            //matchIndex에 뒤집혀진 카드의 index 값을 넣고, 뒤집힌 카드가 동일한 카드임을 방지하기 위한 과정
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true
             } else {
                 indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
        }
 
    
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
        }
        // TODO: Shuffle the cards
        
    }
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

