//
//  QuoteHelper.swift
//  RemindMeNow
//
//  Created by Giselle Martinez on 7/28/15.
//  Copyright (c) 2015 Giselle Martinez. All rights reserved.
//

import UIKit

class QuoteHelper: NSObject {
    
    var quotes = [String]()
    
    override init() {
        
        super.init()
        
        if let quoteFilePath = NSBundle.mainBundle().pathForResource("Quotes", ofType: "txt"), streamReader = StreamReader(path: quoteFilePath) {
            for quote in streamReader {
                if !quote.isEmpty {
                    quotes.append(quote)
                }
            }
        } else {
            preconditionFailure("ERROR: COULD NOT GET QUOTE FILE")
        }
    }
    
    func fetchRandomQuote() -> (String){
        return quotes[Int(arc4random_uniform(UInt32(quotes.count)))]
    }
    
}
