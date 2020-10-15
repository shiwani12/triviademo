//
//  MainVC.swift
//  Trivia App
//
//  Created by Shiwani manhas on 13/10/20.
//  Copyright © 2020 Shiwani manhas. All rights reserved.
//

import UIKit
struct btnArr{
    var btn : UIButton
    var lbl : UILabel
}
class MainVC: UIViewController {
    //MARK:- INTERNAL VARIABLES
    var viewNum : Int = 0
    var dtaShow : saveData!
    var arrBtn : [btnArr] = []
    var arrBtn1 : [btnArr] = []
    //MARKS:-OUTLETS
    @IBOutlet weak var btnRadio4: UIButton!
    @IBOutlet weak var btnCheck1: UIButton!
    
    @IBOutlet weak var lblColor4: UILabel!
    @IBOutlet weak var lblColor2: UILabel!
    
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnCheck4: UIButton!
    @IBOutlet weak var lblColor3: UILabel!
    @IBOutlet weak var btnCheck3: UIButton!
    @IBOutlet weak var btnCheck2: UIButton!
    @IBOutlet weak var lblColor1: UILabel!
    @IBOutlet weak var lblAnswer4: UILabel!
    @IBOutlet weak var lblAnswer3: UILabel!
    @IBOutlet weak var btnRadio3: UIButton!
    @IBOutlet weak var lblAnswer2: UILabel!
    @IBOutlet weak var btnradio2: UIButton!
    @IBOutlet weak var lblAnswer1: UILabel!
    @IBOutlet weak var btnRadio1: UIButton!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    //MARKS:- OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        arrBtn = [btnArr(btn: btnRadio1, lbl: lblAnswer1),btnArr(btn: btnradio2, lbl: lblAnswer2),btnArr(btn: btnRadio3, lbl: lblAnswer3),btnArr(btn: btnRadio4, lbl: lblAnswer4)]
        arrBtn1 = [btnArr(btn: btnCheck1, lbl: lblColor1),btnArr(btn: btnCheck2, lbl: lblColor2),btnArr(btn: btnCheck3, lbl: lblColor3),btnArr(btn: btnCheck4, lbl: lblColor4)]
        hideShow()
        self.title = "Trivia"
        btnRadio1.setImage(Asset.RadioSelect.image, for: .normal)
        btnradio2.setImage(Asset.RadioUnselect.image, for: .normal)
        btnRadio3.setImage(Asset.RadioUnselect.image, for: .normal)
        btnRadio4.setImage(Asset.RadioUnselect.image, for: .normal)
        btnCheck1.setImage(Asset.Check.image, for: .normal)
        btnCheck2.setImage(Asset.Check.image, for: .normal)
        btnCheck3.setImage(Asset.Check.image, for: .normal)
        btnCheck4.setImage(Asset.Check.image, for: .normal)
        btnNext.addTarget(self, action: #selector(btnNextAct(_:)), for: .touchUpInside)
        btnRadio1.addTarget(self, action: #selector(btnRdaioAct(_:)), for: .touchUpInside)
        btnradio2.addTarget(self, action: #selector(btnRdaioAct(_:)), for: .touchUpInside)
        btnRadio3.addTarget(self, action: #selector(btnRdaioAct(_:)), for: .touchUpInside)
        btnRadio4.addTarget(self, action: #selector(btnRdaioAct(_:)), for: .touchUpInside)
        btnCheck1.addTarget(self, action: #selector(btnCheckAct(_:)), for: .touchUpInside)
        btnCheck2.addTarget(self, action: #selector(btnCheckAct(_:)), for: .touchUpInside)
        btnCheck3.addTarget(self, action: #selector(btnCheckAct(_:)), for: .touchUpInside)
        btnCheck4.addTarget(self, action: #selector(btnCheckAct(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
   
  

}
//MARK:-EXTERNAL FUNCTION
extension MainVC{
    @objc func btnRdaioAct(_ sender : UIButton){
           
           for (num,val) in arrBtn.enumerated(){
               arrBtn[num].btn.setImage(Asset.RadioUnselect.image, for: .normal)
           }
           arrBtn[sender.tag].btn.setImage(Asset.RadioSelect.image, for: .normal)
       }
       @objc func btnCheckAct(_ sender : UIButton){
           if arrBtn1[sender.tag].btn.currentImage == Asset.Check.image{
               arrBtn1[sender.tag].btn.setImage(Asset.Uncheck.image, for: .normal)
           }else{
               arrBtn1[sender.tag].btn.setImage(Asset.Check.image, for: .normal)
           }
             
          }
       @objc func btnNextAct(_ sender : UIButton){
           switch viewNum {
           case 0:
               if tfName.text != ""{
               dtaShow = saveData(date: Date.getCurrentDate(), name: tfName.text!, dtaquestion: [])
               
               viewNum = 1
               hideShow()
               }else{
               self.alert(message: "Please enter name",title: "Alert")
               }
           case 1:
               for val in arrBtn{
                   if val.btn.currentImage == Asset.RadioSelect.image{
                       dtaShow.dtaquestion.append(dtaQuestion(question: lbl2.text!, answer: val.lbl.text!))
                   }
               }
               viewNum = 2
               hideShow()
           case 2:
               
               var textGet : String = ""
               var goForward : Bool = false
               for (num,val) in arrBtn1.enumerated(){
                   if val.btn.currentImage == Asset.Check.image{
                       goForward = true
                       if num == 0{
                         textGet = val.lbl.text!
                       }else{
                         textGet += ", \(val.lbl.text!)"
                       }
                   }
               }
               if goForward{
               let vc = self.storyboard?.instantiateViewController(identifier: "SummaryVC") as! SummaryVC
               
               dtaShow.dtaquestion.append(dtaQuestion(question: lbl3.text!, answer: textGet))
               var data = UserDefaults.standard.getDta()
               let dtaGet = saveData(date: Date.getCurrentDate(), name: dtaShow.name, dtaquestion: dtaShow.dtaquestion)
               data.arrSave.append(dtaGet)
               UserDefaults.standard.saveDtaQuestion(data)
               vc.dtaShow = dtaShow
               self.navigationController?.pushViewController(vc, animated: true)
               }else{
                self.alert(message: "Please select atleast one option",title: "Alert")
            }
           default:
               print("yes")
           }
       }
       func hideShow(){
           switch viewNum {
           case 0:
               view1.isHidden = false
               view2.isHidden = true
               view3.isHidden = true
           case 1:
               view1.isHidden = true
               view2.isHidden = false
               view3.isHidden = true
           case 2:
               view1.isHidden = true
               view2.isHidden = true
               view3.isHidden = false
           default:
               print("yes")
           }
       }
}
