//
//  ImportByPrivateKeyVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class ImportByPrivateKeyVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var privateKeyTxtField: UITextField!
    @IBOutlet weak var walletAddressLabel: UILabel!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressLabel.text
    }
    
    @IBAction func importbtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://bsc-dataseed1.binance.org:443")
       // let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545") // for test net
        
        /**
         * Using this importFromPrivateKey function user can import his wallet from its private key.
         *
         * @param privateKey - private key of wallet address
         * @param Context - activity context
         *
         * @return walletAddress
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let address = try binance.importByPrivateKey(privateKey: privateKeyTxtField.text!)
            walletAddressLabel.text = address?.walletAddress
            copyBtnOutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
