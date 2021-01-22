//
//  ExportPrivateKeyVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class ExportPrivateKeyVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var privateKeyLbl: UILabel!
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
        UIPasteboard.general.string = privateKeyLbl.text
    }
    
    @IBAction func exportBtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://bsc-dataseed1.binance.org:443")
       // let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545") // for test net
        /**
         * Using this exportPrivateKey function user can export walletAddresses privateKey.
         *
         * @param walletAddress
         * @param password - password of provided wallet address
         * @param Context - activity context
         *
         * @return privateKey
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let privateKey = try binance.exportPrivateKey(walletAddress: walletAddressTxtField.text!,
                                                          password: passwordTxtField.text!)
            privateKeyLbl.text = privateKey.toHexString()
            copyBtnOutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
}
