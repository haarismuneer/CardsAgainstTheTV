//
//  StartScreenViewController.swift
//  CardsAgainstTheTV
//
//  Created by Haaris Muneer on 8/6/16.
//  Copyright © 2016 Flatiron School. All xrights reserved.
//

import UIKit
import SnapKit
import SwiftyButton

class StartScreenViewController: UIViewController {
    
    var titleLabel: UILabel!
    var nameTextField: UITextField!
    var newGameButton: SwiftyButton!
    var joinGameButton: SwiftyButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }

    func setUpViews() {

        
        titleLabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.text = "Cards Against the TV"
        titleLabel.font = UIFont(name: "Futura", size: 36)
        self.view.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view)
            make.centerY.equalTo(self.view).multipliedBy(0.6)
            
        }
        
        nameTextField = UITextField()
        self.view.addSubview(nameTextField)
        nameTextField.placeholder = "Enter name"
        nameTextField.borderStyle = .RoundedRect
        nameTextField.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.5)
            
        }
        
        
        newGameButton = SwiftyButton()
        newGameButton.addTarget(self, action: #selector(newGameButtonTapped), forControlEvents: .TouchUpInside)
        newGameButton.setTitle("Create new game", forState: .Normal)
        newGameButton.buttonColor = UIColor.colorWithHex("59C497", alpha: 1.0)!
        newGameButton.shadowColor = UIColor.colorWithHex("40B080", alpha: 1.0)!
        newGameButton.shadowHeight = 5
        newGameButton.cornerRadius = 5
        self.view.addSubview(newGameButton)
        newGameButton.snp_makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp_bottom).offset(50)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.6)
        }
        
        
        joinGameButton = SwiftyButton()
        joinGameButton.addTarget(self, action: #selector(joinGameButtonTapped), forControlEvents: .TouchUpInside)
        joinGameButton.setTitle("Join existing game", forState: .Normal)
        joinGameButton.buttonColor = UIColor.colorWithHex("59C497", alpha: 1.0)!
        joinGameButton.shadowColor = UIColor.colorWithHex("40B080", alpha: 1.0)!
        joinGameButton.shadowHeight = 5
        joinGameButton.cornerRadius = 5
        self.view.addSubview(joinGameButton)
        joinGameButton.snp_makeConstraints { (make) in
            make.top.equalTo(newGameButton.snp_bottom).offset(30)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view).multipliedBy(0.6)
        }
    }
    
    func newGameButtonTapped() {
        
        if nameTextField.text?.characters.count < 2 {
            self.showAlert("Error", message: "Please enter a name with at least 2 characters before creating or joining a game.")
        }
    }
    
    func joinGameButtonTapped() {
        
        if nameTextField.text?.characters.count < 2 {
            self.showAlert("Error", message: "Please enter a name with at least 2 characters before creating or joining a game.")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

}

extension StartScreenViewController: UITextFieldDelegate {
    
}
