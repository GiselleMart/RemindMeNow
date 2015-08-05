//
//  QuoteHelper.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/28/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit

class QuoteHelper: NSObject, UIWebViewDelegate {
    
    var webView : UIWebView = UIWebView()
    
    var completed : Bool = false
    
    override init() {
        
        super.init()
        
        self.webView.delegate = self
        
        loadRandomPage()
        
        //        webView.loadRequest(NSURLRequest()
        
    }
    
    func loadRandomPage() {
        
        let randomPage = 1 + Int(arc4random_uniform(9))
        
        let url = "http://www.brainyquote.com/quotes/keywords/motivation_\(randomPage).html"
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
        
    }
    
    func fetchRandomQuote() -> (String){
        
        let randomQuote = 1 + Int(arc4random_uniform(15))
        
        
        
        let quoteScript = "document.getElementsByClassName('bqQuoteLink')[\(randomQuote)].getElementsByTagName('a')[0].innerHTML"
        
        let authorScript = "document.getElementsByClassName('bq-aut')[\(randomQuote)].getElementsByTagName('a')[0].innerHTML"
        
        //        println("\(authorScript) \(quoteScript)");
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "loadRandomPage", userInfo: nil, repeats: false)
        
        if let author = webView.stringByEvaluatingJavaScriptFromString(authorScript), let quote = webView.stringByEvaluatingJavaScriptFromString(quoteScript) {
            
            return "\(quote) ~\(author)"
            
        } else {
            
            return ""
            
        }
        
        
        //        println(url)
        
        //        webView.loadR
        
    }
    
    //    func webViewDidFinishLoad(webView: UIWebView) {
    
    //        println("Did Finish Loading")
    
    //        let randomQuote = 1 + Int(arc4random_uniform(15))
    
    //          println("\(author): \(quote)")
    
    //    }
    
}