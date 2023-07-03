//
//  ViewController.swift
//  MagicTravel
//
//  Created by Kauê Nascimento on 02/07/23.
//

import UIKit

class ViewController: UIViewController {
//IB means Interface Builder
    @IBOutlet var countriesTableView: UITableView!
    var countries: [String] = ["Brazil","Argentina","Germany","Canada","United states","India","China","Japan","Mexico","Ghana","Angola"]
    
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         countriesTableView.register(UITableViewCell.self,
                                     forCellReuseIdentifier: Constants.cellIdentifier)
//         countriesTableView.dataSource = self
//         countriesTableView.delegate = self
         
     }
 }

 extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int {
         return countries.count
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView,
                    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
         
         var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
         cellContentConfiguration.text = countries[indexPath.row]
         tableViewCell.contentConfiguration = cellContentConfiguration
         
         return tableViewCell
     }
 }

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped on cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

