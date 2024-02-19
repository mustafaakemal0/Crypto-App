//
//  ViewController.swift
//  CryptoCrazyRxswiftMVVM
//
//  Created by Mustafa Kemal Özen on 21.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var cryptoList = [Crypto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].Currency
        content.secondaryText = cryptoList[indexPath.row].Price
        cell.contentConfiguration = content
        return cell
    }


}

