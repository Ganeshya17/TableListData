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
    var staticJsonResponse: TableListModel?
    
    override func setUp() {
        super.setUp()
        json()
    }
    func json() {
        let url = Bundle.main.url(forResource: "Tabledata", withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let str = String(decoding: jsonData, as: UTF8.self) // convert json into string
            let data = str.data(using: .utf8)!
            if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                staticJsonResponse = try JSONDecoder().decode(TableListModel.self, from: jsonData)
            } else {
                print("json error")
            }
        } catch {
            print(error)
        }
    }
    func testCase(){
        XCTAssert(staticJsonResponse?.rows.count == 14, "Json response count not equal")
        XCTAssertEqual(staticJsonResponse?.title, "About Canada")
    }
    
    func testCaserow1(){
        XCTAssertEqual(staticJsonResponse?.rows[0].title ?? "", "Beavers")
        XCTAssertEqual(staticJsonResponse?.rows[0].rowDescription ?? "" , "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony")
        XCTAssertEqual(staticJsonResponse?.rows[0].imageHref ?? "" , "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg")
    }
    func testCaserow2(){
        XCTAssertEqual(staticJsonResponse?.rows[1].title ?? "", "Flag")
        XCTAssertEqual(staticJsonResponse?.rows[1].rowDescription ?? "" , "")
        XCTAssertEqual(staticJsonResponse?.rows[1].imageHref ?? "" , "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")
    }
    func testCaserow3(){
        XCTAssertEqual(staticJsonResponse?.rows[2].title ?? "", "Transportation")
        XCTAssertEqual(staticJsonResponse?.rows[2].rowDescription ?? "" , "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.")
        XCTAssertEqual(staticJsonResponse?.rows[2].imageHref ?? "" , "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg")
    }
    func testCaserow4(){
        XCTAssertEqual(staticJsonResponse?.rows[3].title ?? "", "Hockey Night in Canada")
        XCTAssertEqual(staticJsonResponse?.rows[3].rowDescription ?? "" , "These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.")
        XCTAssertEqual(staticJsonResponse?.rows[3].imageHref ?? "" , "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg")
    }
    func testCaserow5(){
        XCTAssertEqual(staticJsonResponse?.rows[4].title ?? "", "Eh")
        XCTAssertEqual(staticJsonResponse?.rows[4].rowDescription ?? "" , "A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation.")
        XCTAssertEqual(staticJsonResponse?.rows[4].imageHref ?? "" , "")
    }
    func testCaserow6(){
        XCTAssertEqual(staticJsonResponse?.rows[5].title ?? "", "Housing")
        XCTAssertEqual(staticJsonResponse?.rows[5].rowDescription ?? "" , "Warmer than you might think.")
        XCTAssertEqual(staticJsonResponse?.rows[5].imageHref ?? "" , "http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png")
    }
    func testCaserow7(){
        XCTAssertEqual(staticJsonResponse?.rows[6].title ?? "", "Public Shame")
        XCTAssertEqual(staticJsonResponse?.rows[6].rowDescription ?? "" , " Sadly it's true.")
        XCTAssertEqual(staticJsonResponse?.rows[6].imageHref ?? "" , "http://static.guim.co.uk/sys-images/Music/Pix/site_furniture/2007/04/19/avril_lavigne.jpg")
    }
    func testCaserow8(){
        XCTAssertEqual(staticJsonResponse?.rows[7].title ?? "", "")
        XCTAssertEqual(staticJsonResponse?.rows[7].rowDescription ?? "" , "")
        XCTAssertEqual(staticJsonResponse?.rows[7].imageHref ?? "" , "")
    }
    func testCaserow9(){
        XCTAssertEqual(staticJsonResponse?.rows[8].title ?? "", "Space Program")
        XCTAssertEqual(staticJsonResponse?.rows[8].rowDescription ?? "" , "Canada hopes to soon launch a man to the moon.")
        XCTAssertEqual(staticJsonResponse?.rows[8].imageHref ?? "" , "http://files.turbosquid.com/Preview/Content_2009_07_14__10_25_15/trebucheta.jpgdf3f3bf4-935d-40ff-84b2-6ce718a327a9Larger.jpg")
    }
    func testCaserow10(){
        XCTAssertEqual(staticJsonResponse?.rows[9].title ?? "", "Meese")
        XCTAssertEqual(staticJsonResponse?.rows[9].rowDescription ?? "" , "A moose is a common sight in Canada. Tall and majestic, they represent many of the values which Canadians imagine that they possess. They grow up to 2.7 metres long and can weigh over 700 kg. They swim at 10 km/h. Moose antlers weigh roughly 20 kg. The plural of moose is actually 'meese', despite what most dictionaries, encyclopedias, and experts will tell you.")
        XCTAssertEqual(staticJsonResponse?.rows[9].imageHref ?? "", "http://caroldeckerwildlifeartstudio.net/wp-content/uploads/2011/04/IMG_2418%20majestic%20moose%201%20copy%20(Small)-96x96.jpg")
    }
    func testCaserow11(){
        XCTAssertEqual(staticJsonResponse?.rows[10].title ?? "", "Geography")
        XCTAssertEqual(staticJsonResponse?.rows[10].rowDescription ?? "" , "It's really big.")
        XCTAssertEqual(staticJsonResponse?.rows[10].imageHref ?? "" , "")
    }
    func testCaserow12(){
        XCTAssertEqual(staticJsonResponse?.rows[11].title ?? "", "Kittens...")
        XCTAssertEqual(staticJsonResponse?.rows[11].rowDescription ?? "" , "Éare illegal. Cats are fine.")
        XCTAssertEqual(staticJsonResponse?.rows[11].imageHref ?? "" , "http://www.donegalhimalayans.com/images/That%20fish%20was%20this%20big.jpg")
    }
    func testCaserow13(){
        XCTAssertEqual(staticJsonResponse?.rows[12].title ?? "", "Mounties")
        XCTAssertEqual(staticJsonResponse?.rows[12].rowDescription ?? "" , "They are the law. They are also Canada's foreign espionage service. Subtle.")
        XCTAssertEqual(staticJsonResponse?.rows[12].imageHref ?? "" , "http://3.bp.blogspot.com/__mokxbTmuJM/RnWuJ6cE9cI/AAAAAAAAATw/6z3m3w9JDiU/s400/019843_31.jpg")
    }
    func testCaserow14(){
        XCTAssertEqual(staticJsonResponse?.rows[13].title ?? "", "Language")
        XCTAssertEqual(staticJsonResponse?.rows[13].rowDescription ?? "" , "Nous parlons tous les langues importants.")
        XCTAssertEqual(staticJsonResponse?.rows[13].imageHref ?? "" , "")
    }

}
