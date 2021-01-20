//
//  ImportByKeystoreVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class ImportByKeystoreVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var keystoreTxtView: UITextView! {
        didSet {
            keystoreTxtView.layer.borderWidth = 2.0
            keystoreTxtView.layer.cornerRadius = 5.0
            keystoreTxtView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    @IBOutlet weak var passwordUiLabel: UITextField!
    @IBOutlet weak var walletAddressTxtField: UILabel!
    @IBOutlet weak var copyBtnoutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressTxtField.text
    }
    @IBAction func importBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545")
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let walletAddress = try binance.importByKeystore(keystore: keystoreTxtView.text!, password: passwordUiLabel.text!)
            walletAddressTxtField.text = walletAddress?.walletAddress
            copyBtnoutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
}
