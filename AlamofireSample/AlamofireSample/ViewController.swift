//
//  ViewController.swift
//  AlamofireSample
//
//  Created by Kazunori Aoki on 2021/03/30.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tblCountries: UITableView!
    var countries = [Country()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblCountries.dataSource = self
        
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandler { [weak self] (countries, status, message) in
            if status {
                guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tblCountries.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countrycell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countrycell")
        }
        
        let country = countries[indexPath.row]
        cell?.textLabel?.text = (country.name ?? "") + " " + (country.countryCode ?? "")
        cell?.detailTextLabel?.text = country.capital ?? ""
        
        return cell!
    }
}
