//
//  MainViewController.swift
//  ABWebView
//
//  Created by Asif Bilal on 10/08/2017.
//  Copyright © 2017 Asif Bilal. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadWebViewController(_ sender: Any) {
        
        let webViewController = ABWebViewController()
        webViewController.URLToLoad = "https://apple.com"
        navigationController?.pushViewController(webViewController, animated: true)
        
    }

}
