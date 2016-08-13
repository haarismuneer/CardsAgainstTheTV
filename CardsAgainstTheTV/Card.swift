//
//  Card.swift
//  CardsAgainstTheTV
//
//  Created by Johann Kerr on 8/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

//TODO : Add Firebase 

let blackCardPlaceholder = "________"

enum CardType: String{
    case White = "A", Black = "Q"
}

struct Card{
    let content: String
    let type: CardType
    let expansion: String
    
    
    init(content:String, type:CardType, expansion:String){
        self.content = content
        self.type = type
        self.expansion = expansion
    }
}

struct Deck{
    var cardArray = [Card]()
    init(array: [Card]){
        self.cardArray = array
    }
}


