//
//  DetailsVC.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import UIKit

class DetailsVC: UIViewController {
    

    @IBOutlet weak var schoolName: UILabel!
    
    
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var readingScore: UILabel!
    
    
    @IBOutlet weak var writingScore: UILabel!

    
    @IBOutlet weak var address: UILabel!
    
    
    @IBOutlet weak var cityState: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadDetailView(_ school: School){
                
        schoolName.text = school.school_name
        
        if let criticalReadingScore = school.scoreDetails?.sat_critical_reading_avg_score{
            readingScore.text = "Average Reading Score - " + criticalReadingScore
        }
        
        if let writingAverageScore = school.scoreDetails?.sat_writing_avg_score{
            writingScore.text = "Average Writing Score - " + writingAverageScore
        }
        
        if let mathAverageScore = school.scoreDetails?.sat_math_avg_score{
            mathScore.text = "Average Math Score - " + mathAverageScore
        }
        
        address.text = school.primary_address_line_1
        
        if let city = school.city, let code = school.state_code, let zip = school.zip{
            cityState.text = "\(city), \(code), \(zip)"
        }
        website.text = school.website
        
        phone.text = school.phone_number
        
        
        
    }
    
}


