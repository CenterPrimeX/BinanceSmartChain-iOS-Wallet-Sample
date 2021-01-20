//
//  SendBEP20TokenVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK
import BigInt

class SendBEP20TokenVC: UIViewController {

    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var senderAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var contractAddressTxtField: UITextField!
    @IBOutlet weak var receiverAddressTxtLabel: UITextField!
    @IBOutlet weak var amountTxtField: UITextField!
    @IBOutlet weak var gasLimitTxtField: UITextField!
    @IBOutlet weak var txHashTxField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func sendBtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545")
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let gas = BigUInt(gasLimitTxtField.text!)
            
            let tx = try binance.sendBEP20Token(walletAddress: senderAddressTxtField.text!, password: passwordTxtField.text!, receiverAddress: receiverAddressTxtLabel.text!, tokenAmount: amountTxtField.text!, tokenContractAddress: contractAddressTxtField.text!, gasPrice: "100", gasLimit: gas!)
            txHashTxField.text = tx
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
