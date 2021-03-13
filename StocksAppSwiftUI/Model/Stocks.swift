//
//  Stocks.swift
//  StocksAppSwiftUI
//
//  Created by Vinnicius Pereira on 13/03/21.
//

import Foundation

struct Stock: Decodable{
    let symbol: String
    let description: String
    let price: Double
    let change: String
    
}
