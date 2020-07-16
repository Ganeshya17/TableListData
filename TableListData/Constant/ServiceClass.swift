//
//  ServiceClass.swift
//  TableListData
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import Foundation

class ServiceClass: NSObject {
    static let Session = ServiceClass()
    public var listResponse:TableListModel?
    /**
     Global Service function
     */
    public func getService(responseHandler: @escaping ((_ response: TableListModel? ,_ error: String)-> Swift.Void)) {
        guard let url = URL(string: AppConstant.serviceUrl)  else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                return
            }
            if statusCode != 200 {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let str = String(decoding: data, as: UTF8.self) // convert json into string
                let data = str.data(using: .utf8)!
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:Any] {
                        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                        // json Success response
                        self.listResponse = try JSONDecoder().decode(TableListModel.self, from: jsonData)
                        responseHandler(self.listResponse, error?.localizedDescription ?? "")
                    } else {
                        print("json error")
                    }
                }
            } catch { // json error message
                print("error", error)
            }
        })
        task.resume()
    }
}
