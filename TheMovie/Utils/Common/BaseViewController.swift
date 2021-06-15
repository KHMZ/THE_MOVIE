//
//  BaseViewController.swift
//  TheMovie
//
//  Created by Macbook Pro on 14/06/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BaseViewController: UIAlertViewDelegate{
    public func showAlert(_ title: String!, message: String,titleAction: String, ViewController: UIViewController,ok: @escaping () -> ()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.OK, style: .default, handler: nil)
        alert.addAction(action)
//        // let backView = alert.view.subviews.last?.subviews.last
//        alert.view.backgroundColor = settinginfo.getCurrentBackgroundColor()
//        alert.view.tintColor = settinginfo.getCurrentFontColor()
        alert.view.layer.cornerRadius = 10
        alert.view.tintColor = UIColor.black
        ViewController.present(alert, animated: true, completion: nil)
    }
}
