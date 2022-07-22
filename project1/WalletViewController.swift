//
//  WalletViewController.swift
//  project1
//
//  Created by Sena Nur Sari on 3/19/22.
//

import Foundation

import UIKit

class WalletViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var walletTV: UITableView!
    
    
    var myStocks = items


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        walletTV.delegate = self
        walletTV.dataSource = self

        walletTV.reloadData()
        self.navigationController!.isNavigationBarHidden = true
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.walletTV.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = walletTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].ticker
        return cell
    }
    
}


