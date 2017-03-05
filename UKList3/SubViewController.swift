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
    @IBOutlet var CateName: UILabel!
    var selectedCateName: String!
    var selectedItem: String?
    @IBOutlet var chkImg: UIImageView!
    @IBOutlet var cellname: UILabel!
    

    
    
    // チェックリストの項目とチェック状態
    var checkListItem: [String : Bool] = [:]
  
    
    //ボタンの状態を保持しておくためのインスタンス作成
    let joutai = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カテゴリネームをタップ先より受信
        CateName.text = selectedCateName
        print("\(CateName.text)")
        
        if selectedCateName == "Kitchen" {
        //=====Kitchen==================
            if (joutai.object(forKey: "Kitchen") != nil) {
                checkListItem = joutai.object(forKey: "Kitchen") as! [String : Bool]
                print("\(checkListItem)ヌルじゃない時の初期値です")
            }else{
                print("最初だけこっち")
                checkListItem = [
                    "ゴミ袋" : true,
                    "食器用洗剤" : true,
                    "スポンジ" : true,
                    "キッチンペーパー" : false,
                    "ラップ" : true,
                    "アルミホイル": true,
                    "三角コーナー用ネット": true]
            }
        }else if selectedCateName == "Landry"{
        //=====Landry==================
            if (joutai.object(forKey: "Landry") != nil) {
                checkListItem = joutai.object(forKey: "Landry") as! [String : Bool]
                print("Landryの\(checkListItem)ヌルじゃない時の初期値です")
            }else{
                print("最初だけこっち")
                checkListItem = [
                    "洗剤" : true,
                    "柔軟剤" : true,
                    "おしゃれ着洗剤" : true,
                    "漂白剤" : false]
            }
        }else if selectedCateName == "Bus/Toilet"{
        //=====Bus/Toilet==================
            if (joutai.object(forKey: "bus") != nil) {
                checkListItem = joutai.object(forKey: "bus") as! [String : Bool]
                print("busの\(checkListItem)ヌルじゃない時の初期値です")
            }else{
                print("最初だけこっち")
                checkListItem = [
                    "シャンプー" : true,
                    "リンス" : true,
                    "ボディソープ" : true,
                    "洗顔" : true,
                    "クレンンジグ" : true,
                    "歯ブラシ" : true,
                    "歯磨き粉" : true,
                    "お風呂用洗剤" : true,
                    "浴室用ブラシ" : true,
                    "カミソリ" : true,
                    "トイレ用洗剤" : true,
                    "トイレットペーパー" : true,
                    "ワックス" : true,
                    "排水溝パイプクリーナー" : true]
            }
        }else if selectedCateName == "Living"{
        //=====Livig==================
            if (joutai.object(forKey: "Living") != nil) {
                checkListItem = joutai.object(forKey: "Living") as! [String : Bool]
                print("Livingの\(checkListItem)ヌルじゃない時の初期値です")
            }else{
                print("最初だけこっち")
                checkListItem = [
                    "クイックルワイパー" : true,
                    "コロコロ" : true,
                    "ファブリーズ" : true,
                    "ティッシュ" : true]
            }
        }else {
        //=====Cosme==================
            if (joutai.object(forKey: "Cosme") != nil) {
                checkListItem = joutai.object(forKey: "Cosme") as! [String : Bool]
                print("Cosmeの\(checkListItem)ヌルじゃない時の初期値です")
            }else{
                print("最初だけこっち")
                checkListItem = [
                    "化粧水" : true,
                    "乳液" : true,
                    "美容液" : true,
                    "クリーム" : true,
                    "下地" : true,
                    "ファンデーション" : true,
                    "パウダー" : true,
                    "チーク" : true,
                    "アイシャドウ" : true,
                    "アイブロウ" : true,
                    "アイライナー" : true,
                    "マスカラ" : true,
                    "リップ" : true,
                    "ファンデ用スポンジ" : true]
            }
        }
    
    }
    
    
    

    @IBAction func AllCrea(_ sender: Any) {
        if CateName.text == "Kitchen"{
            checkListItem = [
                "ゴミ袋" : true,
                "食器用洗剤" : true,
                "スポンジ" : true,
                "キッチンペーパー" : true,
                "ラップ" : true,
                "アルミホイル": true,
                "三角コーナー用ネット": true]
            joutai.set(self.checkListItem, forKey: "Kitchen")
            joutai.synchronize()
        }else if CateName.text == "Landry"{
            checkListItem = [
                "洗剤" : true,
                "柔軟剤" : true,
                "おしゃれ着洗剤" : true,
                "漂白剤" : false]
            joutai.set(self.checkListItem, forKey: "Landry")
            joutai.synchronize()
        }else if CateName.text == "Bus/Toilet"{
            checkListItem = [
                "シャンプー" : true,
                "リンス" : true,
                "ボディソープ" : true,
                "洗顔" : true,
                "クレンンジグ" : true,
                "歯ブラシ" : true,
                "歯磨き粉" : true,
                "お風呂用洗剤" : true,
                "浴室用ブラシ" : true,
                "カミソリ" : true,
                "トイレ用洗剤" : true,
                "トイレットペーパー" : true,
                "ワックス" : true,
                "排水溝パイプクリーナー" : true]
            joutai.set(self.checkListItem, forKey: "bus")
            joutai.synchronize()
        }else if CateName.text == "Living"{
            checkListItem = [
                "クイックルワイパー" : true,
                "コロコロ" : true,
                "ファブリーズ" : true,
                "ティッシュ" : true]
            joutai.set(self.checkListItem, forKey: "Living")
            joutai.synchronize()
        }else{
            checkListItem = [
                "化粧水" : true,
                "乳液" : true,
                "美容液" : true,
                "クリーム" : true,
                "下地" : true,
                "ファンデーション" : true,
                "パウダー" : true,
                "チーク" : true,
                "アイシャドウ" : true,
                "アイブロウ" : true,
                "アイライナー" : true,
                "マスカラ" : true,
                "リップ" : true,
                "ファンデ用スポンジ" : true]
            joutai.set(self.checkListItem, forKey: "Cosme")
            joutai.synchronize()
        }
        
    
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
        print("\(cellText)")
        
        //チェック状態が true なら、初めからチェック状態の画像を入れ込む
        if self.checkListItem[cellText]! {
            cell.imageView?.image = UIImage(named: "unchecked")
         
        }else{
            cell.imageView?.image = UIImage(named: "checked")
        }
        
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = table.viewWithTag(6) as! UILabel
        label2.text = "\(keys[indexPath.row])"
        return cell
        }
    
    // セルがタップされた時の処理
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            if let cell = tableView.cellForRow(at: indexPath){
            // タップしたセルのテキストを取得
            var keys2 = [String](checkListItem.keys)
            selectedItem = "\(keys2[indexPath.row])"
               print("★★\(selectedItem)")
            // 画像を切り替えと Dictonary の値を変更
           if cell.imageView?.image == UIImage(named: "checked") {
                self.checkListItem.updateValue(true, forKey: selectedItem!)
                print("\(checkListItem)")
                print("買った")
                cell.imageView?.image = UIImage(named: "unchecked")
            
                if CateName.text == "Kitchen" {
                    joutai.set(self.checkListItem, forKey: "Kitchen")
                    joutai.synchronize()
             
                }else if CateName.text == "Landry"{
                    joutai.set(self.checkListItem, forKey: "Landry")
                    joutai.synchronize()
                }else if CateName.text == "Bus/Toilet"{
                    joutai.set(self.checkListItem, forKey: "bus")
                    joutai.synchronize()
                }else if CateName.text == "Living" {
                    joutai.set(self.checkListItem, forKey: "Living")
                    joutai.synchronize()
                }else{
                    joutai.set(self.checkListItem, forKey: "Living")
                    joutai.synchronize()
                }
           }else {
                self.checkListItem.updateValue(false, forKey: selectedItem!)
                cell.imageView?.image = UIImage(named: "checked")
                print("\(checkListItem)")
                print("買わんきゃ")
            
                if CateName.text == "Kitchen" {
                    joutai.set(self.checkListItem, forKey: "Kitchen")
                    joutai.synchronize()
                }else if CateName.text == "Landry"{
                    joutai.set(self.checkListItem, forKey: "Landry")
                    joutai.synchronize()
                }else if CateName.text == "Bus/Toilet"{
                    joutai.set(self.checkListItem, forKey: "bus")
                    joutai.synchronize()
                }else if CateName.text == "Living"{
                    joutai.set(self.checkListItem, forKey: "Living")
                    joutai.synchronize()
                }else{
                    joutai.set(self.checkListItem, forKey: "Cosme")
                    joutai.synchronize()
                }
            }
            
            // 選択状態を解除
            cell.isSelected = false
            }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    

   
}
