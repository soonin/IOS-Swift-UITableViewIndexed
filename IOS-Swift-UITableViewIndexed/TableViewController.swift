//
//  TableViewController.swift
//  IOS-Swift-UITableViewIndexed
//
//  Created by Pooya on 2018-11-12.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var carDictionary = [String:[String]]()
    var carSectionTitles = [String]()
    var cars: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen"]
        
        for car in cars {
            let carKey = String(car.prefix(1))
            if var carValues = carDictionary[carKey] {
                carValues.append(car)
                carDictionary[carKey] = carValues
            } else {
                carDictionary[carKey] = [car]
            }
        }
        
        carSectionTitles = [String](carDictionary.keys)
        carSectionTitles = carSectionTitles.sorted(by: {$0 < $1})
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return carSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let carKey = carSectionTitles[section]
        if let carValues = carDictionary[carKey] {
            return carValues.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let carKey = carSectionTitles[indexPath.section]
        if let carValues = carDictionary[carKey] {
            cell.textLabel?.text = carValues[indexPath.row]
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return carSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return carSectionTitles
    }


}
