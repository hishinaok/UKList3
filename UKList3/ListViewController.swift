//
//  ListViewController.swift
//  UKList3
//
//  Created by Naoko Hishinuma on 2017/03/09.
//  Copyright © 2017年 Naoko Hishinuma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var topbtn2: UIButton!
    @IBOutlet weak var allcrabtn2: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // チェックリストの項目とチェック状態
    var checkListItem: [String : Bool] = [:]
    var checkListItem1: [String : Bool] = [:]
    var checkListItem2: [String : Bool] = [:]
    var checkListItemKL: [String : Bool] = [:]
    var checkListItemBLi: [String : Bool] = [:]
    var checkListItemMerge: [String : Bool] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7019607843, green: 0.8862745098, blue: 0.8470588235, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 0.7019607843, green: 0.8862745098, blue: 0.8470588235, alpha: 1)
        
        topbtn2.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9019607843, blue: 0.6666666667, alpha: 1)
        topbtn2.layer.cornerRadius = 10
        topbtn2.layer.masksToBounds = true
        
        allcrabtn2.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9019607843, blue: 0.6666666667, alpha: 1)
        allcrabtn2.layer.cornerRadius = 10
        allcrabtn2.layer.masksToBounds = true
        
        checkListItem1 = joutai.object(forKey: "Kitchen") as! [String : Bool]
        checkListItem2 = joutai.object(forKey: "Landry") as! [String : Bool]
        checkListItemKL = checkListItem1.merged(with: checkListItem2)
        
        checkListItem1 = joutai.object(forKey: "bus") as! [String : Bool]
        checkListItem2 = joutai.object(forKey: "Living") as! [String : Bool]
        checkListItemBLi = checkListItem1.merged(with: checkListItem2)
        
        checkListItemMerge = checkListItemKL.merged(with: checkListItemBLi)
        
        checkListItem1 = joutai.object(forKey: "Cosme") as! [String : Bool]
        checkListItem = checkListItemMerge.merged(with: checkListItem1)

    }

    
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItem.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = table.dequeueReusableCell(withIdentifier: "subtable2Cell", for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.9199255705, green: 0.9616718888, blue: 0.7431330085, alpha: 1)
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        cell.imageView?.layer.borderColor = UIColor.gray.cgColor
        cell.imageView?.layer.borderWidth = 0.5
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cell.textLabel?.font = UIFont(name: "uzura_font", size: 18)
        
        // Dictonary のキーの配列を取得
        var keys = [String](checkListItem.keys)
        //keyでソート
        keys.sort()
        // キーの文字列を取得
        let cellText = keys[indexPath.row]
        
        //チェック状態が true ならセルをかくす
        if self.checkListItem[cellText]! {
            cell.isHidden = true
        }else{
            cell.imageView?.image = UIImage(named: "checked")
            cell.textLabel?.text = cellText
        }
       return cell
    }
    
    
    
    //セルの高さ指定する関数
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var keys = [String](checkListItem.keys)
        keys.sort()
        let cellText = keys[indexPath.row]
        
        //チェック状態が true ならセルの高さを０へ
        if self.checkListItem[cellText]! {
            return 0
        }else{
            return 70
        }
    }
    
    
    //UserDefaultsを空っぽにする機能
    @IBAction func AllCreaBtn2(_ sender: Any) {
        joutai.removeObject(forKey: "Kitchen")
        joutai.removeObject(forKey: "Landry")
        joutai.removeObject(forKey: "bus")
        joutai.removeObject(forKey: "Living")
        joutai.removeObject(forKey: "Cosme")
        joutai.synchronize()
        checkListItem = [:]
        tableView.reloadData()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
}



//辞書を結合するextension
extension Dictionary {
    mutating func merge<S: Sequence>(contentsOf other: S) where S.Iterator.Element == (key: Key, value: Value) {
        for (key, value) in other {
            self[key] = value
        }
    }
    
    func merged<S: Sequence>(with other: S) -> [Key: Value] where S.Iterator.Element == (key: Key, value: Value) {
        var dic = self
        dic.merge(contentsOf: other)
        return dic
    }
}


