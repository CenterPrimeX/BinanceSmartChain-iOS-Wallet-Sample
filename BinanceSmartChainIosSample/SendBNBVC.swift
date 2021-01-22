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
        /**
         * Using this sendBNB function you can send BNB from walletAddress to another walletAddress.
         *
         * @param senderWalletAddress - must be provided sender's wallet address
         * @param password - User must enter password of wallet address
         * @param gasPrice - gas price: 30
         * @param gasLimit - gas limit atleast 21000 or more
         * @param bnbAmount - amount of BNB which user want to send
         * @param receiverWalletAddress - wallet address which is user want to send BNB
         * @param Context - activity context
         *
         * @return if sending completes successfully the function returns transactionHash or returns error name
         */
        let walletAddress = senderWalletAddressTxtField.text!
        let password = passwordTxtField.text!
        let receiverAddress = receiverWalletAddressTxtField.text!
        let bnbAmount = bnbAmountTxtField.text!
        let gas = BigUInt(gasLimitTxtField.text!)
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let tx = try binance.sendBnb(walletAddress: walletAddress,
                                         password: password,
                                         receiverAddress: receiverAddress,
                                         etherAmount: bnbAmount,
                                         gasPrice: BigUInt("100"),
                                         gasLimit: gas!)
            txIdlabel.text = tx
            
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
