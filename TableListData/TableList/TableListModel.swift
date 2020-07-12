//
//  TableListModel.swift
//  TableListData
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import Foundation
struct TableListModel: Codable {
    let title: String
    let rows: [Row]
}
// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?
    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
