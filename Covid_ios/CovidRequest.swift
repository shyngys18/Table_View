//
//  CovidRequest.swift
//  Covid_ios
//
//  Created by Шынгыс on 4/11/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import Foundation

enum HolidayError:Error {
    case noDataAvailable
    case canNotProcessData
}
struct CovidRequest{
    let resourceURL:URL
    let API_KEY = "6b1af41dd6e8a6b7d2ccd14d0c590d016b3cbb29"
    

    init (countryCode:String){
        let resourceString = "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=2020"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    
}
    func getHolidays (completion: @escaping(Result<[HolidayDetail],HolidayError>) -> Void){
        let dataTask  = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
                
            }
            do{
                let decoder = JSONDecoder()
                let holidaysResponce = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponce.response.holidays
                completion(.success(holidayDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
            
        }
          dataTask.resume()
    }
  
   
}
