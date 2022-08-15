//
//  ScoreDetails.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import Foundation

struct ScoreDetails: Codable {
    let dbn: String?
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
