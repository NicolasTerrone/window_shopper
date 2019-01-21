//
//  CurrencyTxtField.swift
//  window_shopper
//
//  Created by Nicolas Terrone on 21/01/2019.
//  Copyright © 2019 Nicolas Terrone. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size = CGFloat(20)
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLbl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        currencyLbl.layer.cornerRadius = 5.0
        currencyLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        currencyLbl.textAlignment = .center
        currencyLbl.clipsToBounds = true
        
        let formater = NumberFormatter()
        formater.numberStyle = .currency
        formater.locale = .current
        currencyLbl.text = formater.currencySymbol
        addSubview(currencyLbl)
    }
    
    override func prepareForInterfaceBuilder() {
        customizeTextField()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeTextField()
    }
    
    func customizeTextField(){
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        clipsToBounds = true
        
        if let place = placeholder {
            attributedPlaceholder = NSAttributedString(string: place, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        }
    }

}

