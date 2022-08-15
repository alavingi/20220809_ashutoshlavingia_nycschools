//
//  SchoolsVC.swift
//  20220809_ashutoshlavingia_nycschools
//
//  Created by Ashutosh Lavingia on 8/14/22.
//

import UIKit

class SchoolsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var alertController: UIAlertController? //To display "Fetching"
    var isAnimating = false
    
    var viewModel: SchoolsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SchoolsViewModel(self)
        
        self.title = "NYC Schools"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let school = sender as? School {
            let detailsView = segue.destination as? DetailsVC
            detailsView?.view.tag = 0   //Setting the tag as example so that view loads it hierarchy.
            detailsView?.loadDetailView(school)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolsCell.identifier) as! SchoolsCell
        cell.school = viewModel!.schools[indexPath.row]
            
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = viewModel!.schools[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: school)
    }
}
    



    


extension SchoolsVC: SchoolVCDelegate {

    func fetchComplete(){
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
    }
    
}


