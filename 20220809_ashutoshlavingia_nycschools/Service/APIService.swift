//
//  APIService.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import Foundation

struct APIService {
    

    
    func fetchData(urlString: String, completionHandler: @escaping (Any?, Error?) -> ()) -> (){
        
        guard let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else { return }
        
        guard let url = URL(string: encodedString) else {
            print("Invalid URL")
            completionHandler([], nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 403 {
                    print("Access Denied.")
                    completionHandler([], error)
                }
            }
            
            if error != nil {
                print("Webservice returned error.")
                completionHandler([], error)
                return
            }
            
            guard data != nil else {
                print("No data found")
                completionHandler([], error)
                return
            }
            
            completionHandler(data, error)
        }
        task.resume()
    }
}
