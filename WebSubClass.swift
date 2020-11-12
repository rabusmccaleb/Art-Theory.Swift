//
//  WebSubClass.swift
//  Art Theory
//
//  Created by Rabus Mccaleb on 11/25/19.
//  Copyright © 2019 Rabus Mccaleb. All rights reserved.
//

import Foundation
import AVFoundation
import WebKit

class WebSubView : UIViewController, WKUIDelegate, WKNavigationDelegate{

    
    var webView = WKWebView()
    override func loadView() {
        super.loadView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
       // self.WebUIView.addSubview(webView)
       view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var UrlForDisplay = URL(string: "https://www.instagram.com/rossoleo_/")!///will need to optionally bind this to to the view when ready
        var Request = URLRequest(url: UrlForDisplay)
        webView.load(Request)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        PaginaSingleton.share.PaginaIsLoading = true/// sets it to true such that the value can be notified to the PaginaViewClass
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //
        PaginaSingleton.share.PaginaDidLoad = true
        /// timer to retrunt all of these to false such that if and when the view is pulled up again logic can proceed as if it were done for the first time
        var LoadingTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ResetSingletonBooleans), userInfo: nil, repeats: false)
    }
    
    @objc func ResetSingletonBooleans(){
        PaginaSingleton.share.PaginaIsLoading = false
        PaginaSingleton.share.PaginaDidLoad = false
    }
    
}
