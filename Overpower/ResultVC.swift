//
//  ResultVC.swift
//  OverPowered
//
//  Created by Bright Future on 22/07/2017.
//  Copyright © 2017 Bright Future. All rights reserved.
//

import UIKit

class ResultVC: UITableViewController {
    
    var result: [(name: String, value: String)] {
        if Router.shared.getResult().count > 0 {
            return Router.shared.getResult()
        } else {
            return [("Please input more information".localizedString(), "")]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel!.text = result[indexPath.row].name
        cell.detailTextLabel!.text = result[indexPath.row].value

        return cell
    }

}
