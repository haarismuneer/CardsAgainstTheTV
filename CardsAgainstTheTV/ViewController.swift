//
//  ViewController.swift
//  CardsAgainstTheTV
//
//  Created by Haaris Muneer on 8/5/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import SnapKit
import PromiseKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var blackCards = [Card]()
    var whiteCards = [Card]()
    var allCards = ([Card](), [Card]())
    var cardCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        
//        let bCards = CardManager.loadCards().0
//        let wCards = CardManager.loadCards().1
//        
//        
//        for card in bCards{
//            print(card.content)
//            
//        }
        self.addSubviews()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addSubviews(){
        

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        layout.scrollDirection = .Horizontal
        layout.itemSize = CGSize(width: 300, height: 400
        )
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        
        self.cardCollectionView = UICollectionView(frame: CGRectNull, collectionViewLayout: layout)
        
        self.cardCollectionView.backgroundColor = UIColor.clearColor()
        
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.registerClass(CardCell.self, forCellWithReuseIdentifier: CardCell.reuseIdentifier)
        self.view.addSubview(self.cardCollectionView)
        
        self.allCards = CardManager.loadCards {
            self.cardCollectionView.reloadData()
            
        }
        
        createConstraints()
        
    }
    
    func chooseCard(){
        
    }
    
    func createConstraints(){
        self.cardCollectionView.snp_makeConstraints{(make) in
            make.bottom.equalTo(self.view).offset(-80)
            
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(400)
        }
    }

}

extension ViewController{

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.whiteCards.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CardCell.reuseIdentifier, forIndexPath: indexPath) as! CardCell
        cell.backgroundColor = UIColor.orangeColor()
        cell.setCard(allCards.0[indexPath.row])
        return cell
    }
    
}

