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

class TableListViewController: UIViewController {
    let tableListView = TableListView()
    var refreshControl = UIRefreshControl()
    var viewModelList = TableListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    /**
     To  setUoTableView setUp function
     */
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
    /**
        To refresh table view
     */
    @objc func refresh(_ sender: AnyObject) {
        viewModelList.getListdata()
    }
    /**
     Call this function to get TableList values
     */
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

extension TableListViewController: UITableViewDelegate, UITableViewDataSource {
    /**
       TableList data count function
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelList.listModelData?.rows.count ?? 0
    }
    /**
      cell data disply function
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableListCell = TableListCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: AppConstant.cellIdentifier)
        if  let row = viewModelList.listModelData?.rows[indexPath.row] {
            cell.configure(viewModel: row )
        }
        return cell
    }
    /**
     Dynamic Cell method
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
