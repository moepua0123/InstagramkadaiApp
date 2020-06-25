//
//  PostData.swift
//  Instagram
//
//  Created by 西山萌花 on 2020/06/23.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    //課題追加
    var commentName: [String] = []
    var comment: [String] = []

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String

        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        //課題追加
        if let commentName = postDic["commentName"] as? [String]{
        self.commentName = commentName
        }
        
        if let comment = postDic["comment"] as? [String]{
        self.comment = comment
        }
        
        
        
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}
