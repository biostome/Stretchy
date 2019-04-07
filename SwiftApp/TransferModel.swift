//
//  TransferModel.swift
//  LuckyBet
//
//  Created by nathan on 2019/3/29.
//  Copyright © 2019年 nathan. All rights reserved.
//

import Foundation

struct TransferModel:Decodable {
    let code:String
    let name:String
    var balance:String?
    mutating func update(ba:String) {
        self.balance = ba
    }
}
