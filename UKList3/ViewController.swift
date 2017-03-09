//
//  ViewController.swift
//  UKList3
//
//  Created by Naoko Hishinuma on 2017/02/27.
//  Copyright © 2017年 Naoko Hishinuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var UKList_Title: UILabel!
    @IBOutlet weak var Crabtn: UIButton!
    @IBOutlet weak var Listbtn: UIButton!
    
    @IBOutlet var table: UITableView!
    //var selectedImage: UIImage?
    var selectedCategoryName: String?
    
    
    // section毎の画像配列
    let imgArray: NSArray = ["kitchen1.png", "landry.png", "bus.png", "living.jpg", "cosme.png"]
    let label2Array: NSArray = ["Kitchen", "Landry", "Bus/Toilet", "Living", "Cosme"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7019607843, green: 0.8862745098, blue: 0.8470588235, alpha: 1)
        self.table.backgroundColor = #colorLiteral(red: 0.7019607843, green: 0.8862745098, blue: 0.8470588235, alpha: 1)
        //UKList_Title.backgroundColor = #colorLiteral(red: 0.9199255705, green: 0.9616718888, blue: 0.7431330085, alpha: 1)
        UKList_Title.layer.cornerRadius = 10
        UKList_Title.layer.masksToBounds = true
        
        Crabtn.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9019607843, blue: 0.6666666667, alpha: 1)
        Crabtn.layer.cornerRadius = 10
        Crabtn.layer.masksToBounds = true
        
        Listbtn.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9019607843, blue: 0.6666666667, alpha: 1)
        Listbtn.layer.cornerRadius = 10
        Listbtn.layer.masksToBounds = true
        
        /* ボタンっぽくしたいのにできないー
        Crabtn.layer.shadowColor = UIColor.gray.cgColor
        Crabtn.layer.shadowOffset = CGSize(width: 10, height: 20)
        Crabtn.layer.shadowOpacity = 20
        Crabtn.layer.shadowRadius = 1
        label.layer.shadowColor = [UIColor blackColor].CGColor;        // シャドウカラー
        label.layer.shadowOffset = CGSizeMake(1, 1);        //  シャドウサイズ
        label.layer.shadowOpacity = 1.0;        // 透明度
        label.layer.shadowRadius = 1;
        */
        
        }

    @IBAction func AllCreaBtn(_ sender: Any) {
        //UserDefaultsを空っぽにする機能
            joutai.removeObject(forKey: "Kitchen")
            joutai.removeObject(forKey: "Landry")
            joutai.removeObject(forKey: "bus")
            joutai.removeObject(forKey: "Living")
            joutai.removeObject(forKey: "Cosme")
            joutai.synchronize()
    }
        
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let img = UIImage(named:"\(imgArray[indexPath.row])")
            
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.image = img
            
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = table.viewWithTag(2) as! UILabel
        label2.text = "\(label2Array[indexPath.row])"
        //label2.backgroundColor = #colorLiteral(red: 0.7019607843, green: 0.8862745098, blue: 0.8470588235, alpha: 1)
        //label2.layer.cornerRadius = 15
        //label2.layer.masksToBounds = true
        
        cell.backgroundColor = #colorLiteral(red: 0.9199255705, green: 0.9616718888, blue: 0.7431330085, alpha: 1)
        //cell.layer.borderColor = UIColor.clear.cgColor
        //cell.layer.borderWidth = 20.0
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        
        
            return cell
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        selectedCategoryName = "\(label2Array[indexPath.row])"
        if selectedCategoryName != nil {
            performSegue(withIdentifier: "toSubViewController", sender: nil)
        }
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewController のselectedImgに選択されたカテゴリ名を設定する
          subVC.selectedCateName = selectedCategoryName!
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

