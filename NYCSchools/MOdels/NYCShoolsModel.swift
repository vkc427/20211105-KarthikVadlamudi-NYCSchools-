//
//  NYCShoolsModel.swift
//  NYCSchools
//
//  Created by Karthik Vadlamudi on 5/11/21.
//

import Foundation

struct HighSchoolInfo: Codable {
    var school_name: String?
    var school_email: String?
    var zip: String?
    var city: String?
    var dbn: String?
    
    enum CodingKeys: String, CodingKey {
        case school_name = "school_name"
        case school_email = "school_email"
        case zip = "zip"
        case city = "city"
        case dbn = "dbn"
      }
}

struct SatScoreInfo: Codable {
    var school_name: String?
    var mathAvg: String?
    var writingAvg: String?
    var criticalAvg: String?
    var numberofStudents: String?
    var dbn: String?
    
    enum CodingKeys: String, CodingKey {
        case school_name = "school_name"
        case mathAvg = "sat_math_avg_score"
        case writingAvg = "sat_writing_avg_score"
        case numberofStudents = "num_of_sat_test_takers"
        case criticalAvg = "sat_critical_reading_avg_score"
        case dbn = "dbn"
      }
}
