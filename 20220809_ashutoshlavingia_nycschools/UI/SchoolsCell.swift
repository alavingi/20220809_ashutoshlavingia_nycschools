//
//  SchoolsCell.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import UIKit

class SchoolsCell: UITableViewCell {
    
    static let identifier = "SchoolsCell"
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    var school: School! {
        didSet {
            name.text = school.school_name
            
            if let schoolCity = school.city, let state = school.state_code, let zip = school.zip{
                city.text = "\(schoolCity), \(state), \(zip)"
            }
             
        }
    }
}
