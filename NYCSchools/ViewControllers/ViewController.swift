//
//  ViewController.swift
//  NYCSchools
//
//  Created by Karthik Vadlamudi on 5/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var resultsData = [HighSchoolInfo]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        //need to add Unit tests.
        super.viewDidLoad()
        getNYCSchools()
        // Do any additional setup after loading the view.
    }
    
    func getNYCSchools() {
        //tried to avoid third party, with more time i can add the MBProgressHUD which would easily show the acitivity indicator for API calls.
        NYCSchoolService().getHighSchools { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.resultsData = data
                    self.tableView.reloadData()
                    print(self.resultsData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(message: Messages.ErrorMessage)
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error!!!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //can add pull to refresh with more time.
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolInfoTableViewCell") as! SchoolInfoTableViewCell
        let highScool = self.resultsData[indexPath.row]
        let kempty = "-"
        //Basic functionality, with more time could have displayed more info and with proper labelling.
        cell.city.text = highScool.city ?? kempty
        cell.zip.text = highScool.zip ?? kempty
        cell.schoolName.text = highScool.school_name ?? kempty
        cell.email.text = highScool.school_email ?? kempty
        return cell

    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let highScool = self.resultsData[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController {
            vc.dbn = highScool.dbn
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}

