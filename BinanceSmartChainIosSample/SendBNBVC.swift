//
//  SendBNBVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK
import BigInt

class SendBNBVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var senderWalletAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var receiverWalletAddressTxtField: UITextField!
    @IBOutlet weak var bnbAmountTxtField: UITextField!
    @IBOutlet weak var gasLimitTxtField: UITextField!
    @IBOutlet weak var txIdlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBnbAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://bsc-dataseed1.binance.org:443")
       // let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545") // for test net
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let gas = BigUInt(gasLimitTxtField.text!)
            let tx = try binance.sendBnb(walletAddress: senderWalletAddressTxtField.text!, password: passwordTxtField.text!, receiverAddress: receiverWalletAddressTxtField.text!, etherAmount: bnbAmountTxtField.text!, gasPrice: BigUInt("100"), gasLimit: gas!)
            txIdlabel.text = tx
            
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
