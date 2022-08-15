//
//  _0220809_ashutoshlavingia_nycschoolsTests.swift
//  20220809_ashutoshlavingia_nycschoolsTests
//
//  Created by Ashutosh Lavingia on 8/13/22.
//

import XCTest
@testable import _0220809_ashutoshlavingia_nycschools

class APIServiceTests: XCTestCase {
    
    let apiService = APIService()
    
    func testFetchSchools() {
        
        let exp = expectation(description: "Fetch schools success.")
        let urlString = Constants.schoolsURL
        
        apiService.fetchData(urlString: urlString) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<School>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "Schools fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetchScores() {
        
        let exp = expectation(description: "Fetch scores success.")
        let urlString = Constants.scoresURL
        
        apiService.fetchData(urlString: urlString) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<ScoreDetails>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "SAT Scores fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}

