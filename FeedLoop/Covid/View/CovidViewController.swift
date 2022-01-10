//
//  CovidViewController.swift
//  FeedLoop
//
//  Created by Miftah Juanda Batubara on 10/01/22.
//

import UIKit
import TinyConstraints
import RxSwift
import RxCocoa


class CovidViewController: UIViewController {
    
    private let covidViewModel = CovidViewModel()
    private let dispose = DisposeBag()
    
    private var tableView:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.register(CovidTableViewCell.self, forCellReuseIdentifier: CovidTableViewCell.idCell)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
//        tableView.delegate = self
//        tableView.dataSource = self

        covidViewModel.getDataCovid()
        
        // Do any additional setup after loading the view.
        setUIView()
        setDataView()
    }
    
    private func setUIView(){
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setDataView() {
        covidViewModel.covidModelObserve
            .bind(to: self.tableView
                                                .rx
                                                .items(cellIdentifier: CovidTableViewCell.idCell,
                                                       cellType: CovidTableViewCell.self)) { (row, branch, cell) in
            
            cell.countryLabel.text = branch.attributes.countryRegion
            cell.deathLabel.text = "Deaths : \(branch.attributes.deaths ?? 0)"
            cell.recovLabel.text = "Recovered : \(branch.attributes.recovered ?? 0)"
            cell.confirmedLabel.text = "Confirmed: \(branch.attributes.confirmed ?? 0)"
            cell.activemedLabel.text = "Active: \(branch.attributes.active ?? 0)"
            cell.backgroundColor = .clear
        }
                                                       
    }
    
}
