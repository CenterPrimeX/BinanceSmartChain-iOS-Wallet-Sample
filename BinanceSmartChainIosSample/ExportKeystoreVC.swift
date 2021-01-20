//
//  ExportKeystoreVC.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/20.
//

import UIKit
import BinanceSmartChainSDK

class ExportKeystoreVC: UIViewController {
    
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletTxtField: UITextField!
    @IBOutlet weak var keystoreUITextView: UITextView!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissbtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = keystoreUITextView.text
    }
    
    @IBAction func exportBtnAction(_ sender: Any) {
        
        /**
            @param infura - Initialize infura
         */
        let binance = BnbWalletManager.init(infuraUrl: "https://data-seed-prebsc-1-s1.binance.org:8545")
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            keystoreUITextView.text = try binance.exportKeystore(walletAddress: walletTxtField.text!)
            copyBtnOutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}
