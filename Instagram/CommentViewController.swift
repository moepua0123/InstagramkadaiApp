//
//  CommentViewController.swift
//  Instagram
//
//  Created by 西山萌花 on 2020/06/24.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var CommentTextField: UITextField!
    var postData: PostData!
    //課題追加　コメント投稿ボタンが押された時
    @IBAction func postCommentButton(_ sender: Any) {
        //コメントの取得
        var oldcomment = postData.comment
        let username = postData.name
        let comment = username! + CommentTextField.text!
        
            // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
            //updateValue = FieldValue.arrayUnion([myid])
        oldcomment.append(comment)
        
       //コメント欄に更新データを書き込む
        let commentRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        
        commentRef.updateData(["comment":oldcomment])
        
        //すでにあるコメントに追加していく→昔のコメントも更新されてしまう
        //let oldcomment = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        //oldcomment.updateData(["comment":CommentTextField.text!])
        

        //ユーザー名の保存
        

        // Firebaseに投稿データを保存する
        //let name = Auth.auth().currentUser?.displayName
        //let postDic = [
       // "commentName": name!,
        //"comment": self.CommentTextField.text!,
//        ] as [String : Any]
//        commentRef.setData(postDic)
        
       
        // HUDで投稿処理中の表示を開始
        //SVProgressHUD.show()
        
       
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        // 投稿処理が完了したので画面を戻す
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
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
