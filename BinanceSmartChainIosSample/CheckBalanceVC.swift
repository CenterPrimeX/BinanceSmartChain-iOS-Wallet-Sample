//
//  CheckBalanceVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class CheckBalanceVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletAddressTxtFieldOutlet: UITextField!
    @IBOutlet weak var balanceLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://bsc-dataseed1.binance.org:443")
        
       // let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545") // for test net
        /**
         * Using this getBnbBalance function you can check balance of provided walletAddress.
         *
         * @param walletAddress - which user want to check it's balance
         *
         * @return if the function completes successfully returns balance of provided wallet address or returns error name
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let balance = try binance.getBnbBalance(walletAddress: walletAddressTxtFieldOutlet.text!)
            balanceLabelOutlet.text = "BNB balance: " + balance!
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
