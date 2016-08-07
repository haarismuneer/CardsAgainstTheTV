//
//  StartScreenViewController.swift
//  CardsAgainstTheTV
//
//  Created by Haaris Muneer on 8/6/16.
//  Copyright © 2016 Flatiron School. All xrights reserved.
//

import UIKit
import SnapKit

class StartScreenViewController: UIViewController {
    
    var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.colorWithHex("76f45b", alpha: 1.0)
        setUpStackView()
        
    }

    func setUpStackView() {
        stackView = UIStackView()
        stackView.axis = .Vertical
        stackView.alignment = .Center
        stackView.distribution = .FillEqually
        self.view.addSubview(stackView)
        stackView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self.view)
        })
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.text = "Cards Against the TV"
        titleLabel.font = UIFont(name: "Futura", size: 30)
        stackView.addArrangedSubview(titleLabel)
        
        let nameTextField = UITextField()
        nameTextField.placeholder = "Enter name"
        stackView.addArrangedSubview(nameTextField)
        
        let newGameButton = UIButton()
        newGameButton.setTitle("Create new game", forState: .Normal)
        newGameButton.backgroundColor = UIColor.lightGrayColor()
        stackView.addArrangedSubview(newGameButton)
        
        let joinGameButton = UIButton()
        joinGameButton.setTitle("Join existing game", forState: .Normal)
        joinGameButton.backgroundColor = UIColor.lightGrayColor()
        stackView.addArrangedSubview(joinGameButton)

    }

}

extension StartScreenViewController {
    
}
