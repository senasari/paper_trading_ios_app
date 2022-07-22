//
//  StockPricesViewController.swift
//  project1
//
//  Created by Sena Nur Sari on 3/19/22.
//
import UIKit

import Foundation


class StockPricesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let url: String = ""
    var mstocks: [MStock] = []
    

    var snpList = ["AAPL", "MSFT", "AMZN", "TSLA", "GOOG", "NVDA", "FB", "GS", "CRM", "BA", "B"]
    
    @IBOutlet weak var stockPriceTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockPriceTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        async {
            print("FROM VIEW CONTROLLER")
            for ticker in snpList {
                let result = await fetchStock(ticker)

                if (!result.isEmpty) {
                    print(result[0].price)
                    print(result[0].symbol)
                    self.mstocks.append(result[0])
                }
            }
            
            DispatchQueue.main.async {
                self.stockPriceTableView.reloadData()
            }
            
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var myString = mstocks[indexPath.row].symbol + "    " + String(mstocks[indexPath.row].price)
        cell.textLabel!.text = myString
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mstocks.count
    }
    
    
    

}
    
    

