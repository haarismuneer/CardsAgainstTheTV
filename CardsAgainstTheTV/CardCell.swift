//
//  CardCell.swift
//  CardsAgainstTheTV
//
//  Created by Johann Kerr on 8/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    var cardLabel: UILabel!
    static let reuseIdentifier = "CardCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cardLabel = UILabel()
        cardLabel.textAlignment = .Center
        
        
        
        
        self.addSubview(cardLabel)
        createConstraints()
    }
    func setCard(card: Card){
        self.cardLabel.text = card.content
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createConstraints(){
        self.cardLabel.snp_makeConstraints{(make) in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
            
        }
    }
 
    
    
    
}
