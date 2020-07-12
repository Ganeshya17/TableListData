//
//  TableListVC.swift
//  TableListData
//
//  Created by Syed Riyaz on 10/07/20.
//  Copyright © 2020 Ganesh Raja. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class TableListVC: UIViewController {
    let tableListView = TableListView()
    var refreshControl = UIRefreshControl()
    let appdelegate = AppDelegate()
    var value = 0
    var viewModelList = TableListViewModel()
    var staticJsonResponse: TableListModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    func setup() {
        self.view.addSubview(tableListView)
        tableListView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        tableListView.tableView.register(TableListCell.self, forCellReuseIdentifier: AppConstant.cellIdentifier)
        tableListView.tableView.delegate = self
        tableListView.tableView.dataSource = self
        tableListView.tableView.rowHeight = UITableView.automaticDimension
        tableListView.tableView.estimatedRowHeight = 60
        refreshControl.attributedTitle = NSAttributedString(string: AppConstant.pullToRefresh)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableListView.tableView.addSubview(refreshControl)
        viewModelList.getListdata()
        config()
    }
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        viewModelList.getListdata()
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
                print(staticJsonResponse?.title ?? "")
            } else {
                print("json error")
            }
        } catch {
            print(error)
        }
    }
    func config() {
        viewModelList.onSuccess = { [weak self] (response) in
            DispatchQueue.main.async {
                self?.navigationItem.title = self?.viewModelList.listModelData?.title ?? ""
                self?.refreshControl.endRefreshing()
                self?.tableListView.tableView.reloadData()
            }
        }
    }
}

extension TableListVC: UITableViewDelegate, UITableViewDataSource { // Table List data Loading
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelList.listModelData?.rows.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableListCell = tableView.dequeueReusableCell(withIdentifier: AppConstant.cellIdentifier, for: indexPath) as! TableListCell
        cell.confogCellData(row: viewModelList.listModelData?.rows ?? [], index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
