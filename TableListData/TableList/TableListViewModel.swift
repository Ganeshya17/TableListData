//
//  TableListViewModel.swift
//  TableListData
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import Foundation
class  TableListViewModel {
    var listModelData: TableListModel?
    var onSuccess: ((_ response: TableListModel) -> Void)?
    var onError: ((_ error: String) -> Void)?
    /**
     Call this function to get TableList values
     */
    func getListdata() {
        Activity.show()
        ServiceClass.Session.getService(responseHandler: { (response,error)  in
            Activity.hide()
            if response != nil {
                self.listModelData = response
                self.onSuccess?(response!)
            } else {
                self.onError?(error)
                print("json error", error)
            }
        })
    }
}
