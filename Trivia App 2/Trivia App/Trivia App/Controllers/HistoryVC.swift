//
//  HistoryVC.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    //MARK:- OVERRIDE FUNTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History"
        // Do any additional setup after loading the view.
    }
    


}
//TABLEVIEW DELEGATE
extension HistoryVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return UserDefaults.standard.getDta().arrSave.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTVC", for: indexPath) as! HistoryTVC
        cell.lbl1.text = "Game \(indexPath.row + 1): \(UserDefaults.standard.getDta().arrSave[indexPath.row].date)"
        cell.lbl2.text = "\(UserDefaults.standard.getDta().arrSave[indexPath.row].name)"
        cell.lbl3.attributedText = CommonFuncations.sendAttString([UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14)], colors: [UIColor.black,UIColor.black], texts: ["\(UserDefaults.standard.getDta().arrSave[indexPath.row].dtaquestion[0].question)\n","Answer: \(UserDefaults.standard.getDta().arrSave[indexPath.row].dtaquestion[0].answer)"], align: .left)
        cell.lbl4.attributedText = CommonFuncations.sendAttString([UIFont.systemFont(ofSize: 14),UIFont.systemFont(ofSize: 14)], colors: [UIColor.black,UIColor.black], texts: ["\(UserDefaults.standard.getDta().arrSave[indexPath.row].dtaquestion[1].question)\n","Answers: \(UserDefaults.standard.getDta().arrSave[indexPath.row].dtaquestion[1].answer)"], align: .left)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
