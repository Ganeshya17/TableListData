//
//  StringExtension.swift
//  TableListData
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import Foundation
struct AppConstant {
    static let cellIdentifier = "listData"
    static let serviceUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    static let pullToRefresh = "Pull to refresh"
}

extension String {     // String Enocde & Decode function
    func urlEncode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    func urlDecode() -> String {
        return self.removingPercentEncoding ?? self
    }
}
