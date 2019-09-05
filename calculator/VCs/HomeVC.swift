//
//  HomeVC.swift
//  calculator
//
//  Created by Miki Takahashi on 2019/09/05.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private let calcNames: [String] = ["途中式", "小数", "分数"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calcNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = calcNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var nextVC: UIViewController! = nil
        switch indexPath.row {
        case 0:
            nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "midway") as! ShowMidwayCalc
        case 1:
                nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "decimal") as! DecimalCalc
        case 2:
            nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fraction") as! FractionCalc
        default:
            break
        }
        if nextVC != nil {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

