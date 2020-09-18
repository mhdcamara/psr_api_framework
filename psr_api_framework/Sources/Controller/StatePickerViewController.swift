//
//  StatePickerViewController.swift
//  psr_api
//
//  Created by Mouhamed Camara on 7/6/20.
//  Copyright © 2020 PayDunya. All rights reserved.
//

import UIKit
import SKCountryPicker



protocol StatePickerViewControllerDelegate: class
{
    func statePickerViewController(sender: StatePickerViewController, didSelectNumber number: Int)
}

class StatePickerViewController: UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: StatePickerViewControllerDelegate?
    
    static func instantiate() -> StatePickerViewController?
    {
        let frameworkBundle = Bundle(identifier: "com.paydunya.psr-api-framework")
        
        return UIStoryboard(name: "PayDunyaPSR", bundle: frameworkBundle).instantiateViewController(withIdentifier: "\(StatePickerViewController.self)") as? StatePickerViewController
    }
    
    var dataSources = [Country]()
    
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let senegal = CountryManager.shared.country(withCode: "SN")
        let civoire = CountryManager.shared.country(withCode: "CI")
        let benin = CountryManager.shared.country(withCode: "BJ")
        
        dataSources.append(senegal!)
        dataSources.append(civoire!)
        dataSources.append(benin!)
    }

}

extension StatePickerViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "choixpaysCell")
            return cell!
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statesCell", for: indexPath) as! stateCell
            
            let state = dataSources[indexPath.row - 1]
            
            cell.flag.image = state.flag!
            cell.name.text = state.countryName
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.statePickerViewController(sender: self, didSelectNumber: indexPath.row)
    }
}

class stateCell: UITableViewCell
{
    @IBOutlet weak var flag: UIImageView!
    
    @IBOutlet weak var name: UILabel!
}
