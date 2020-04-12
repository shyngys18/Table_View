//
//  Covid.swift
//  Covid_ios
//
//  Created by Шынгыс on 4/11/20.
//  Copyright © 2020 Шынгыс. All rights reserved.
//

import Foundation
struct HolidayResponse:Decodable{
    var response:Holidays
    
}
struct Holidays:Decodable{
    var holidays:[HolidayDetail]
    
}
struct HolidayDetail:Decodable{
    
    var name:String
    var description:String
    var date:DateInfo
    
}
struct DateInfo:Decodable{
    var iso:String
}
