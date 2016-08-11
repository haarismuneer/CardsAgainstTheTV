//
//  CardManager.swift
//  CardsAgainstTheTV
//
//  Created by Johann Kerr on 8/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation



class CardManager{
    
    //TODO: Add checks for empty deck
    static let gameManager = CardManager()
    var whiteCards = [Card]()
    var blackCards = [Card]()
    
    private var (mWhiteCards, mBlackCards) = ([Card](), [Card]())
    
    class func loadCards(completion:()->()) -> ([Card],[Card]){
        let path = NSBundle.mainBundle().pathForResource("cards", ofType:"json")
        let data = NSData(contentsOfFile: path!)
        let cards = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [[String:String]]
        
        
        var wCards = [Card]()
        var bCards = [Card]()
        
        for card in cards {
            let card = Card(content: card["text"]!,
                            type: CardType(rawValue: card["cardType"]!)!,
                            expansion: card["expansion"]!)
            if card.type == .White {
                wCards.append(card)
            } else {
                bCards.append(card)
            }
        }
        completion()
        return (bCards, wCards)
    }
    class func dealCards() -> [Card]{
        var dealtCards = [Card]()
        
        for i in 0...6{
            dealtCards.append(CardManager.gameManager.whiteCards.popLast()!)
        }
        return dealtCards
    }
    
    func drawWhiteCard() -> Card{
        
        return self.whiteCards.popLast()!
    }
    
    func drawBlackCard() -> Card{
        
        return self.whiteCards.popLast()!
    }
    
    class func nextCardsWithType(type: CardType, count: UInt = 1) -> [Card] {
        let generator = Array(count: Int(count), repeatedValue: 0)
        if type == .Black {
            return generator.map { _ in return CardManager.gameManager.blackCards.popLast()!}
        } else {
            return generator.map { _ in return CardManager.gameManager.whiteCards.popLast()!}
        }
    }
    

    
}