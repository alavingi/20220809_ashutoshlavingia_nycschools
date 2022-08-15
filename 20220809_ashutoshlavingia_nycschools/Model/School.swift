//
//  School.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import Foundation

struct School: Codable {
    let dbn: String?
    let school_name: String?
    
    let phone_number: String?
    let fax_number: String?
    let school_email: String?
    let website: String?
    
    
    let primary_address_line_1: String?
    let city: String?
    let zip: String?
    let state_code: String?
    
    var scoreDetails: ScoreDetails? //sets the SAT Scores object
}

