//
//  ViewController.swift
//  window_shopper
//
//  Created by Nicolas Terrone on 21/01/2019.
//  Copyright © 2019 Nicolas Terrone. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var wageTxt: CurrencyTxtField!
    @IBOutlet weak var priceTxt: CurrencyTxtField!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var hoursLbl: UILabel!
    @IBOutlet weak var clearCalculatorBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculateBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calculateBtn.backgroundColor = #colorLiteral(red: 1, green: 0.2597229183, blue: 0, alpha: 1)
        calculateBtn.setTitle("Calculate", for: .normal)
        calculateBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calculateBtn.addTarget(self, action: #selector(MainVC.calcultate), for: .touchUpInside)
        
        wageTxt.inputAccessoryView = calculateBtn
        priceTxt.inputAccessoryView = calculateBtn
        
        hideUnusedUI()
        
    }
    
    @objc func calcultate(){
        if let wageTxt = wageTxt.text, let priceTxt = priceTxt.text{
            if let wageTxt = Double(wageTxt), let priceTxt = Double(priceTxt){
                resultLbl.text = ("\(Wage.getHours(forWage: wageTxt, andPrice: priceTxt))")
                resultLbl.isHidden = false
                hoursLbl.isHidden = false
                view.endEditing(true)
                clearCalculatorBtn.isHidden = false
            }
        }
    }

    @IBAction func clearCalculatorPressed(_ sender: Any) {
        hideUnusedUI()
        wageTxt.text = ""
        priceTxt.text = ""
    }
    
    private func hideUnusedUI(){
        resultLbl.isHidden = true
        hoursLbl.isHidden = true
        clearCalculatorBtn.isHidden = true
    }
}


