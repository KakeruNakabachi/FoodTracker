//
//  ViewController.swift
//  FoodTracker
//
//  Created by Kakeru Nakabachi on 2017/05/25.
//  Copyright © 2017年 Kakeru Nakabachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
    }
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    //MARK: UITextFieldDelegateで指定されたメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Doneを押すとキーボードが閉じる処理
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        //テキストボックスに値を入れ終わった時にラベルに値を渡す
        mealNameLabel.text = textField.text
    }
}

