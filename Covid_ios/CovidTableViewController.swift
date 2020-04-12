//
//  CovidTableViewController.swift
//  Covid_ios
//
//  Created by Шынгыс on 4/11/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import UIKit

class CovidTableViewController: UITableViewController {

    @IBOutlet var search_bar: UISearchBar!
    
    
    var listOfHolidays = [HolidayDetail](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count) Holidays found "
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        search_bar.delegate = self

      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfHolidays.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let holiday = listOfHolidays[indexPath.row]
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            destination.hero = listOfHolidays[tableView.indexPathForSelectedRow!.row]
        }
    }
 
   
    

   
}
extension CovidTableViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ search_bar: UISearchBar){
        guard let searcBarText = search_bar.text else {return}
        let holidayRequest = CovidRequest(countryCode: searcBarText)
        holidayRequest.getHolidays{[weak self ] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let holidays):
                self?.listOfHolidays = holidays
                
            }
        }

       }
   }
