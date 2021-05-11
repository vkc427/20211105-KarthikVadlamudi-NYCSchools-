//
//  DetailsViewController.swift
//  NYCSchools
//
//  Created by Karthik Vadlamudi on 5/11/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblNumberofStudents: UILabel!
    @IBOutlet weak var lblMathAvg: UILabel!
    @IBOutlet weak var lblCriticalAvg: UILabel!
    @IBOutlet weak var lblWritingAvg: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var dbn: String?
    var resultsData = [SatScoreInfo]()
    var satInfo = SatScoreInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        getSatScores()
        // Do any additional setup after loading the view.
    }
    
    func getSatScores() {
        NYCSchoolService().getSatDetails { (result) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.resultsData = data
                    self.setupUI()
                    print(self.resultsData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(message: Messages.ErrorMessage)
            }
        }
    }
    
    func setupUI() {
        guard let dbn = dbn, let scoreInfo  = self.getSchoolwithDBN(dbn: dbn) else {
            self.lblSchoolName.text = Messages.NoData
            self.bgView.isHidden = true
            return
        }
        self.satInfo = scoreInfo
        self.lblMathAvg.text = self.satInfo.mathAvg
        self.lblSchoolName.text = self.satInfo.school_name
        self.lblWritingAvg.text = self.satInfo.writingAvg
        self.lblCriticalAvg.text = self.satInfo.criticalAvg
        self.lblNumberofStudents.text = self.satInfo.numberofStudents
    }
    
    //could have added this to another utility helper class so that we can call from there instead of repeating the code in every view controller.
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error!!!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getSchoolwithDBN(dbn: String) -> SatScoreInfo? {
        return self.resultsData.filter({$0.dbn == dbn}).first
    }

}
