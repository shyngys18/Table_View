//
//  DetailsViewController.swift
//  Covid_ios
//
//  Created by Шынгыс on 4/11/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var text_label: UILabel!
   
    
   
    var hero:HolidayDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text_label.adjustsFontSizeToFitWidth = true
        text_label.minimumScaleFactor = 0.5
        text_label.text = hero?.description
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
