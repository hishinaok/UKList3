//
//  ViewController.swift
//  UKList3
//
//  Created by Naoko Hishinuma on 2017/02/27.
//  Copyright © 2017年 Naoko Hishinuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    //var selectedImage: UIImage?
    var selectedCategoryName: String?
    
    
    // section毎の画像配列
    let imgArray: NSArray = ["kitchen1.png", "landry.png", "bus.png", "living.jpg", "cosme.png"]
    let label2Array: NSArray = ["Kitchen", "Landry", "Bus/Toilet", "Living", "Cosme"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        imageView.image = img
            
        
        // Tag番号 2 で UILabel インスタンスの生成
        let label2 = table.viewWithTag(2) as! UILabel
        label2.text = "\(label2Array[indexPath.row])"
            
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

