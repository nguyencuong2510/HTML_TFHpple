//
//  ViewController.swift
//  HTML_Tutorial
//
//  Created by cuongnv on 5/29/18.
//  Copyright © 2018 cuongnv. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://www.loft.co.jp/lp/app_posts"
        if let data = try? Data(contentsOf: URL(string: url)!) {
            loadTutorial(data: data)
        }
    }
    
    
    func loadTutorial(data: Data) {
        let parser = TFHpple(htmlData: data)
        let queryString = "//div"
        if let tutorialsNodes = parser?.search(withXPathQuery: queryString) as? [TFHppleElement] {
            for element in tutorialsNodes {
                print("------------")
                print(element.children(withClassName: "clearfix"))
            }
        }
    }
    
}

