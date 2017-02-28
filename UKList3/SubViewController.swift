//
//  SubViewController.swift
//  UKList3
//
//  Created by Naoko Hishinuma on 2017/02/27.
//  Copyright © 2017年 Naoko Hishinuma. All rights reserved.
//

import UIKit

class SubViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    //@IBOutlet var imageView: UIImageView!
    //var selectedImg: UIImage!
    @IBOutlet var CateName: UILabel!
    var selectedCateName: String!
    var selectedItem: String?

    
    
    // チェックリストの項目とチェック状態
    var checkListItem: [String : Bool] = [
        "ゴミ袋" : true,
        "食器用洗剤" : true,
        "スポンジ" : true,
        "キッチンペーパー" : false,
        "ラップ" : true,
        "アルミホイル": true
    ]
  
    
    
    
    //ボタンの状態を保持しておくためのインスタンス作成
    //let joutai = UserDefaults.standard
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CateName.text = selectedCateName
    }
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Dictonary のキーの配列を取得
        return checkListItem.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "subtableCell", for: indexPath)
        
        
        // Dictonary のキーの配列を取得
        var keys = [String](checkListItem.keys)
        // キーの文字列を取得
        let cellText = keys[indexPath.row]
        // Tag番号 1 で UIImageView インスタンスの生成
         // チェック状態が true なら、初めからチェック状態の画像を入れ込む
        let imageView = table.viewWithTag(5) as! UIImageView
        if self.checkListItem[cellText]! {
            imageView.image = UIImage(named: "unchecked")
        }else{
            imageView.image = UIImage(named: "checked")
        }
        
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = table.viewWithTag(6) as! UILabel
        label2.text = "\(keys[indexPath.row])"
        return cell
    }

    
    // セルがタップされた時の処理
        func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        if let cell = table.cellForRow(at: indexPath) {
            
            // タップしたセルのテキストを取得
            let cellText = cell.textLabel?.text
            print("★★\(cellText)")
            var keys2 = [String](checkListItem.keys)
            selectedItem = "\(keys2[indexPath.row])"
               print("★★\(selectedItem)")
        
            

            // 画像を切り替えと Dictonary の値を変更
        /*    if cell.imageView?.image == UIImage(named: "checked") {
                
                self.checkListItem.updateValue(false, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "unchecked")
            } else {
                
                self.checkListItem.updateValue(true, forKey: cellText!)
                cell.imageView?.image = UIImage(named: "checked")
            }*/
            
            // 選択状態を解除
            cell.isSelected = false
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
