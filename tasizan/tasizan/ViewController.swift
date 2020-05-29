//
//  ViewController.swift
//  tasizan
//
//  Created by むむ on 2020/05/29.
//  Copyright © 2020 DEAUX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 枠上
    @IBOutlet weak var inputField1: UITextField!
    // 枠下
    @IBOutlet weak var inputField2: UITextField!
    // ボタン
    @IBOutlet weak var inputButton: UIButton!
    // ラベル
    @IBOutlet weak var inputLabel: UILabel!
    // プラス
    @IBOutlet weak var tasu: UILabel!
    
    
    // 最初
    override func viewDidLoad() {
        super.viewDidLoad()
        inputButton.setTitle("押す", for: .normal)
        tasu.text = "+"
        inputLabel.text = "答え"
    }

    @IBAction func inputButton(sender: UIButton) {
        let x1:Int? = Int(inputField1.text!)
        let x2:Int? = Int(inputField2.text!)
        if x1 == nil || x2 == nil {
            let alert: UIAlertController = UIAlertController(title: "計算できません", message: "算盤を使おう！", preferredStyle:  UIAlertController.Style.alert)

            // ② Actionの設定
            // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
            // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
            // OKボタン
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            // キャンセルボタン
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("Cancel")
            })

            // ③ UIAlertControllerにActionを追加
            alert.addAction(cancelAction)
            alert.addAction(defaultAction)

            // ④ Alertを表示
            present(alert, animated: true, completion: nil)
            return
        }
        let y = x1! + x2!

        inputLabel.text = String(y)
        //ボタンを押したら文字が消える
        inputField1.text = ""
        inputField2.text = ""
    }
    
    // キーボード消える
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
