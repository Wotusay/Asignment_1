//
//  ViewController.swift
//  MagicTravel
//
//  Created by Wout Salembier on 13/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countriesTableView: UITableView!

    var countries = ["Belgium", "France", "Germany", "Netherlands", "United Kingdom", "United States"]
    var continentCountries: [String: String] = ["Belgium": "Europe", "France": "Europe", "Germany": "Europe", "Netherlands": "Europe", "United Kingdom": "Europe", "United States": "North America"]
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)

        var cellContentConfig = tableViewCell.defaultContentConfiguration()
        let country = countries[indexPath.row]
        cellContentConfig.text = country
        cellContentConfig.secondaryText = continentCountries[country] ?? ""
        tableViewCell.contentConfiguration = cellContentConfig
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected \(countries[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
