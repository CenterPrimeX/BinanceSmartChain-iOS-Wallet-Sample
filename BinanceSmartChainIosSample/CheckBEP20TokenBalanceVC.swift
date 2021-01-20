//
//  CheckBEP20TokenBalanceVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class CheckBEP20TokenBalanceVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletAddressTxtField: UITextField!
    @IBOutlet weak var contractAddressTxtField: UITextField!
    @IBOutlet weak var balanceTxtField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        let walletAddress = walletAddressTxtField.text!
        let contract = contractAddressTxtField.text!
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545")
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let balance = try binance.getBEP20TokenBalance(tokenContractAddress: contract, walletAddress: walletAddress)
            balanceTxtField.text = balance
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
