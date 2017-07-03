//
//  ViewController.swift
//  FoodTracker
//
//  Created by Kakeru Nakabachi on 2017/05/25.
//  Copyright © 2017年 Kakeru Nakabachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        /*後の処理は任せちゃおう。他の任せたクラスによって処理が依存する。
        アップルがもともと提供しているクラスを勝手に変えることはできないので
         delegateを使って　アップルが提供しているクラス = self
         とすることで、そのクラスの処理は自分自身のそこのクラス内で実装しますよ
         みたいな感じのニュアンスオーバーライドと似ているけど違う
         今回の場合、UItextfieldをオーバーライドしてしまうと
         ViewControllerクラスがUItextfieldの拡張版みたいになってしまって
         全く別物のはずが同じような者になってしまうのでオーバーライド
         とはまた違ったものとなる。
         delegate = 誰かさん
        */
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
    
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //キーボドが出ている状態でイメージビューがタップされたときキーボドが閉じる処理
        nameTextField.resignFirstResponder()
        //画像ライブラリから画像を選択する機能を提供しているクラスのインスタンス生成
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        //imagePickerControllerで定義されているdelegateメソッドをここで実装しますよという設定
        imagePickerController.delegate = self
        //画像ライブラリの画面に遷移する
        present(imagePickerController, animated:  true, completion: nil)
    }
    

    //MARK: UIImagePickerControllerDelegate
    
    //delegateで処理を委託されてるので、画像選択するときにキャンセルを押されたときの機能を実装する
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        
        //画像ライブラリを選択した後閉じる
        dismiss(animated: true, completion: nil)
        
    }
}

