//
//  ViewController.swift
//  DoSwift
//
//  Created by deepindo on 2020/11/2.
//

import UIKit
import DoKit
import SwiftyJSON
import SVProgressHUD

private let DoElementCellReuseID = "DoElementCellReuseID"
private let DoTextViewCellReuseID = "DoTextViewCellReuseID"

class ViewController: DoVC {

    var titleArr = ["时    间", "名    称", "规    格", "颜    色", "数    量", "备    注"]
    
    var dateStr = ""
    var materialId = ""
    var proName = ""
    var proSpecification = ""
    var proColor = ""
    var proAmount = ""
    var proRemark = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareData()
        
        customNavigation()
        
        prepareSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dateStr = currentDate()
        tableView.reloadData()
    }
    
    //MARK: -  请求数据

    func prepareData() {
    }
    
    func currentDate() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let nowDateStr = timeFormatter.string(from: date) as String
        return nowDateStr
    }
    
    func customNavigation() {
        
        isHiddenBackBtn = true
        customTitle = "物料领取"
        rightBtnImage = "icon_scan"
    }
    
    func prepareSubviews() {
        
        view.backgroundColor = hexColor(0xF0F1F6)
        automaticallyAdjustsScrollViewInsets = false
        tableView.adaptiveTableViewiOS11()
        
        view.addSubview(operateBtn)
        view.addSubview(tableView)
        
        operateBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-kTabBarH-10)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(customNavSepLine.snp.bottom).offset(0)
            make.bottom.equalTo(operateBtn.snp.top).offset(-10)
            make.left.equalTo(0)
            make.right.equalTo(-0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func addBtnDidClick() {
//        let vc = ProductAddVC()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func customRightButtonDidClick() {
        DoPermission.shared.judgePermission(.capture, self) {}
        
        //let vc = ScanViewController()
        //vc.delegate = self
        //navigationController?.pushViewController(vc, animated: true)
        
        let vc = DoScanVC()
        vc.finished = { (result) in
            DDLog(result)
            
//            switch result {
//            case .success(let scanStr):
//                self.materialId = scanStr
//
//                SVProgressHUD.show()
//                SVProgressHUD.setDefaultMaskType(.black)
//                DoAlamofireNetwork.MaterialQRScan(materialId: self.materialId) { (data) in
//                    DDLog(data)
//                    SVProgressHUD.dismiss(withDelay: 0.1)
//
//                    let json = JSON(data)
//
//                    self.proName = json["material_name"].stringValue
//                    self.proSpecification = json["material_gg"].stringValue
//                    self.proColor = json["material_color"].stringValue
//                    self.proRemark = json["material_remark"].stringValue
//
//                    self.tableView.reloadData()
//                } failure: { (error) in
//                    SVProgressHUD.showError(withStatus: error as? String)
//                    SVProgressHUD.dismiss(withDelay: 1.0)
//                }
//            case .failure(.empty):
//                self.view.makeToast("扫描结果为空，重新扫描", duration: 0.5, position: .center)
//                return
//            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tfEditingAction(tf: UITextField) {
        proAmount = tf.text ?? ""
    }
    
    @objc func operateBtnDidClick() {
        self.view.endEditing(true)
        
        if materialId == "" {
//            self.view.makeToast("请先扫码获取物料信息", duration: 0.5, position: .center)
            return
        }
        
        if proAmount == "" {
//            self.view.makeToast("请先输入数量", duration: 0.5, position: .center)
            return
        }
        
        guard let amountValue = Int(proAmount) else { return }
        if amountValue > 999 {
//            self.view.makeToast("数量过大，请重新输入", duration: 0.5, position: .center)
            return
        }
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.black)
        
        DoAlamofireNetwork.MaterialSubmit(materialId: materialId, amount: proAmount, remark: proRemark) { (data) in
            
            SVProgressHUD.showSuccess(withStatus: "提交成功")
            SVProgressHUD.dismiss(withDelay: 0.5)
            
            self.proName = ""
            self.proSpecification = ""
            self.proColor = ""
            self.proAmount = ""
            self.proRemark = ""
            self.tableView.reloadData()
            
        } failure: { (error) in
            SVProgressHUD.showError(withStatus: error as? String)
            SVProgressHUD.dismiss(withDelay: 1.0)
        }
    }
    
    lazy var tableView: UITableView = {
        let v: UITableView = UITableView(frame: .zero, style: .plain)
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.backgroundColor = hexColor(0xF0F1F6)
        
        v.separatorStyle = .none
//        v.dataSource = self
//        v.delegate   = self
        
//        v.register(DoElementCell.self,
//                   forCellReuseIdentifier: DoElementCellReuseID)
//        v.register(DoTextViewCell.self,
//                   forCellReuseIdentifier: DoTextViewCellReuseID)
        
        return v
    }()
    
    lazy var operateBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("提交", for: .normal)
        btn.titleLabel?.font = kCustomFont(16)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.backgroundColor = hexColor(0x1C90FF)
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        btn.addTarget(self,
                      action: #selector(operateBtnDidClick),
                      for: .touchUpInside)
        return btn
    }()
}
/*
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 5 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: DoTextViewCellReuseID, for: indexPath) as! DoTextViewCell
//            cell.cusTitleLabel.text = titleArr[indexPath.row]
//            cell.content = proRemark
//            cell.placeholderLabel.text = "请输入备注"
//            cell.operateClosure = { content in
//                self.proRemark = content
//            }
//            return cell
//        }
//        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: DoElementCellReuseID, for: indexPath) as! DoElementCell
//            cell.cusTitleLabel.text = titleArr[indexPath.row]
//            cell.titleWidthUpdate(w: 80)
//
//            switch indexPath.row {
//            case 0:
//                cell.displayMode()
//                cell.textField.text = dateStr
//            case 1:
//                cell.displayMode()
//                cell.textField.text = proName
//            case 2:
//                cell.displayMode()
//                cell.textField.text = proSpecification
//            case 3:
//                cell.displayMode()
//                cell.textField.text = proColor
//            case 4:
//                cell.inputMode()
//                cell.textField.placeholder = "请输入数量"
//                cell.textField.text = proAmount
//                cell.textField.addTarget(self,
//                                         action: #selector(tfEditingAction(tf:)),
//                                         for: .editingChanged)
//            default:
//                break
//            }

//            return cell
//        }
        
    }
}
*/
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 100
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}

//extension PickingVC: UIScrollViewDelegate {
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        view.endEditing(true)
//    }
//}

//extension ViewController: ScanDelegate {
//
//    func scanResult(_ result: String!) {
//
//        if result == nil || result == "" {
////            self.view.makeToast("扫描结果为空，重新扫描", duration: 0.5, position: .center)
//            return
//        }
//
//        DDLog(result)
//        materialId = result
//
//        SVProgressHUD.show()
//        SVProgressHUD.setDefaultMaskType(.black)
//        DoAlamofireNetwork.MaterialQRScan(materialId: materialId) { (data) in
//            DDLog(data)
//            SVProgressHUD.dismiss(withDelay: 0.1)
//
//            let json = JSON(data)
//
//            self.proName = json["material_name"].stringValue
//            self.proSpecification = json["material_gg"].stringValue
//            self.proColor = json["material_color"].stringValue
//            self.proRemark = json["material_remark"].stringValue
//
//            self.tableView.reloadData()
//        } failure: { (error) in
//            SVProgressHUD.showError(withStatus: error as? String)
//            SVProgressHUD.dismiss(withDelay: 1.0)
//        }
//    }
//}
