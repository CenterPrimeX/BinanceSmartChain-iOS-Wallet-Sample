//
//  ViewController.swift
//  BinanceSmartChainIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createWalletBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CreateWalletVC")
    }
    
    @IBAction func exportKeystoreBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ExportKeystoreVC")
    }
    
    @IBAction func exportPrivateKeyBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ExportPrivateKeyVC")
    }
    
    @IBAction func importByKeystoreBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ImportByKeystoreVC")
    }
    
    @IBAction func importByPrivateKeyBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "ImportByPrivateKeyVC")
    }
    
    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CheckBalanceVC")
    }
    
    @IBAction func checkBEP20TokenBalanceBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "CheckBEP20TokenBalanceVC")
    }
    
    @IBAction func sendBNBBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "SendBNBVC")
    }
    
    @IBAction func sendBEP20TokenBtnAction(_ sender: Any) {
        moveToNextVC(storyBoardID: "SendBEP20TokenVC")
    }
    
    func moveToNextVC(storyBoardID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: storyBoardID)
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

