//
//  SubViewController.swift
//  UKList3
//
//  Created by Naoko Hishinuma on 2017/02/27.
//  Copyright © 2017年 Naoko Hishinuma. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    //@IBOutlet var CateName: UILabel!
    var selectedImg: UIImage!
//    var selectedCateName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedImg
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
