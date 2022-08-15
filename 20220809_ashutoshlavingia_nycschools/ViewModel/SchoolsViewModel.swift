//
//  SchoolsViewModel.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import Foundation

protocol SchoolVCDelegate: AnyObject {
    func fetchComplete()
    
}

class SchoolsViewModel: NSObject {
    var schools: [School] = []

    let apiService = APIService()
    
    weak var delegate: SchoolVCDelegate?
    
    init(_ delegate: SchoolVCDelegate) {
        super.init()
        
        self.delegate = delegate
        self.fetchSchools()
    }
    
    
    func fetchSchools(){
        apiService.fetchData(urlString: Constants.schoolsURL) { (resultData, fetchError) in
            
            if let _ = fetchError{
                print("Error fetching schhols.")
            }else {
                do{
                    let schoolList = try JSONDecoder().decode(Array<School>.self, from: resultData as! Data)
                    
                    self.schools = schoolList
                    self.fetchScores()
                }catch{
                    print("Error parsing school data.")
                }
            }
        }
    }
    
    func fetchScores(){
        apiService.fetchData(urlString: Constants.scoresURL) { (data, error)  in
            
            if let _ = error{
                print("Error fetching scores.")
            }else{
                do{
                    let scores = try JSONDecoder().decode(Array<ScoreDetails>.self, from: data as! Data)
                    self.setScores(scores)
                    self.delegate?.fetchComplete()

                }catch{
                    print("Error parsing score data.")
                }
            }
        }
    }
    
    func setScores(_ scores: [ScoreDetails]){
        let copy = self.schools
        self.schools.removeAll()
        
        for score in scores{
            if let dbn = score.dbn{
                var match = copy.first(where: { (school) -> Bool in
                    return school.dbn == dbn
                })
                
                guard match != nil else{
                    continue
                }
                
                match?.scoreDetails = score
                self.schools.append(match!)
            }
        }
    }
}

