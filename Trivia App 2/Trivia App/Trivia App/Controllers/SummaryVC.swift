//
//  SummaryVC.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class SummaryVC: UIViewController {
    //MARK:- INTERNAL VARIABLES
    var dtaShow : saveData!
    //MARK:- OUTLETS
    @IBOutlet weak var btnHistory: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblName: UILabel!
    //MARKS:- OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        if dtaShow != nil{
        lblName.text = "Hello \(dtaShow.name)"
        }
        self.title = "SUMMARY"
        btnFinish.addTarget(self, action: #selector(btnFinsihAct(_:)), for: .touchUpInside)
        btnHistory.addTarget(self, action: #selector(btnHistoryAct(_:)), for: .touchUpInside)
        tblView.reloadData()
        // Do any additional setup after loading the view.
    }
}
//EXTERMAL FUNCTION
extension SummaryVC{
    @objc func btnFinsihAct(_ sender : UIButton){
    var data = UserDefaults.standard.getDta()
    let dtaGet = saveData(date: Date.getCurrentDate(), name: dtaShow.name, dtaquestion: dtaShow.dtaquestion)
    data.arrSave.append(dtaGet)
    UserDefaults.standard.saveDtaQuestion(data)
    let vc = self.storyboard?.instantiateViewController(identifier: "MainVC") as! MainVC
    vc.viewNum = 0
    self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func btnHistoryAct(_ sender : UIButton){
    var data = UserDefaults.standard.getDta()
    let dtaGet = saveData(date: Date.getCurrentDate(), name: dtaShow.name, dtaquestion: dtaShow.dtaquestion)
    data.arrSave.append(dtaGet)
    UserDefaults.standard.saveDtaQuestion(data)
    let vc = self.storyboard?.instantiateViewController(identifier: "HistoryVC") as! HistoryVC
    self.navigationController?.pushViewController(vc, animated: true)
    }
}
//TABLEVIEW DELEGATE
extension SummaryVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dtaShow != nil{
        return dtaShow.dtaquestion.count
        }else{
        return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTVC", for: indexPath) as! QuestionTVC
        cell.lblQuestion1.text = dtaShow.dtaquestion[indexPath.row].question
        cell.lblQuestion2.text = "Answer: \(dtaShow.dtaquestion[indexPath.row].answer)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
