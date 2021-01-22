//
//  CreateWalletVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class CreateWalletVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var pwdTextFieldoutlet: UITextField!
    @IBOutlet weak var confirmPwdTxtFieldoutlet: UITextField!
    @IBOutlet weak var yourWalletLblOutlet: UILabel!
    @IBOutlet weak var walletAddressLblOutlet: UILabel!
    @IBOutlet weak var copyButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressLblOutlet.text
    }
    
    @IBAction func createBtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://bsc-dataseed1.binance.org:443")
       // let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545") // for test net
        /**
         * Using this createWallet function user can create a wallet.
         *
         * @param password - must be provided password to wallet address
         * @param Context - activity context
         *
         * @return walletAddress
         */
        let password = pwdTextFieldoutlet.text
        let confirmPwd = confirmPwdTxtFieldoutlet.text
        
        if password == confirmPwd {
            let queue = DispatchQueue(label: "createWallet")
            var wallet: String = ""
            queue.async { [self] in
                do {
                    /**
                        if function successfully completes result can be caught in this block
                     */
                    wallet = try binance.createWallet(walletPassword: password!)!.walletAddress!
                    DispatchQueue.main.async { [self] in
                        walletAddressLblOutlet.text = wallet
                        yourWalletLblOutlet.text = "Your wallet address!"
                        copyButtonOutlet.isHidden = false
                    }
                } catch {
                    /**
                         if function fails error can be catched in this block
                     */
                    print(error.localizedDescription)
                }
            }
        } else {
            yourWalletLblOutlet.text = "Please provide same passwords"
        }
    }
}
