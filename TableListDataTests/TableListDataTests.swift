//
//  TableListDataTests.swift
//  TableListDataTests
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import XCTest
@testable import TableListData

class TableListDataTests: XCTestCase {

    let Vc = TableListVC()
    let Cell = TableListCell()
    func testCase(){
        print(Cell.lblTittle.text ?? "")
       // XCTAssertEqual("tre", Vc.staticJsonResponse?.rows[0].rowDescription)
        XCTAssertEqual("tre", Cell.lblTittle.text ?? "")

        XCTAssertNil(Vc.staticJsonResponse?.rows[0].rowDescription)
    }

}
