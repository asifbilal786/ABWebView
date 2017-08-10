//
//  ABWebViewController.swift
//  Lango
//
//  Created by Asif Bilal on 27/09/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit
import WebKit

class ABWebViewController: UIViewController {
    
    // MARK: - class properties
    
    fileprivate let keyLoading = "loading"
    fileprivate let keyEstimateProgress = "estimatedProgress"
    
    
    var URLToLoad: String = ""
    fileprivate var webView: WKWebView
    
    @IBOutlet fileprivate weak var loadingProgress: UIProgressView!
    @IBOutlet fileprivate weak var webViewContainer: UIView!
    
    // MARK: - life cycle
    
    required init?(coder aDecoder: NSCoder) {
        
        webView = WKWebView()
        super.init(coder: aDecoder)
        webView.navigationDelegate = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        webView = WKWebView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        webView.navigationDelegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfigurations()
        registerObservers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        removeObservers()
        visibleActivityIndicator(false)
        
    }
    
    // MARK: - private functions
    
    fileprivate func viewConfigurations() {
        
        edgesForExtendedLayout = []
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
        webViewContainer.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .right, .left]
        
        NSLayoutConstraint.activate(attributes.map {
            NSLayoutConstraint(item: webView, attribute: $0, relatedBy: .equal, toItem: webViewContainer, attribute: $0, multiplier: 1, constant: 0)
        })
        
        guard let url = URL(string: URLToLoad) else {
            print("Couldn't load create NSURL from: " + URLToLoad)
            return
        }
        
        webView.load(URLRequest(url: url))
        
    }
    
    fileprivate func registerObservers() {
        webView.addObserver(self, forKeyPath: keyLoading, options: .new, context: nil)
        webView.addObserver(self, forKeyPath: keyEstimateProgress, options: .new, context: nil)
    }
    
    fileprivate func removeObservers() {
        webView.removeObserver(self, forKeyPath: keyLoading)
        webView.removeObserver(self, forKeyPath: keyEstimateProgress)
    }
    
    fileprivate func visibleActivityIndicator(_ visible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = visible
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title,
                                                                   message: message,
                                                                   preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: - Overridden Methods
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if (keyPath == keyEstimateProgress) {
            loadingProgress.isHidden = webView.estimatedProgress == 1
            loadingProgress.setProgress(Float(webView.estimatedProgress), animated: true)
        }
        
    }
    
    
}

extension ABWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        visibleActivityIndicator(true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        visibleActivityIndicator(false)
        showAlert("", message: error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        visibleActivityIndicator(false)
        loadingProgress.setProgress(0.0, animated: false)
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == WKNavigationType.linkActivated {
            
            let url = navigationAction.request.url
            let shared = UIApplication.shared
            
            if shared.canOpenURL(url!) {
                shared.openURL(url!)
            }
            
            decisionHandler(WKNavigationActionPolicy.cancel)
        }
        
        decisionHandler(.allow)
    }
}
