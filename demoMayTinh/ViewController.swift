//
//  ViewController.swift
//  demoMayTinh
//
//  Created by Khắc Hùng on 03/04/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblResult: UILabel!
    
    var soThuNhat = 0
    var soThuHai = 0
    var soThuNhatDangChuoi = ""
    var soThuHaiDangChuoi = ""
    var dangOTrangThaiThuHai = false
    var phepTinh = ""
    var ketQua = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnCalculatorPressed(_ sender: UIButton) {
     
        lblResult.text! += sender.titleLabel!.text!
        if sender.titleLabel!.text! == "AC" {
            lblResult.text = ""
        }
        
        if sender.titleLabel!.text! == "+" {
            phepTinh = "+"
        }
        if sender.titleLabel!.text! == "-" {
            phepTinh = "-"
            
        }
        if sender.titleLabel!.text! == "x" {
            phepTinh = "x"
            
        }
        if sender.titleLabel!.text! == "/" {
            phepTinh = "/"
        
        }
        if sender.titleLabel?.text! == "="{
                  soThuHaiDangChuoi += lblResult.text!
                  soThuHaiDangChuoi.remove(at: soThuHaiDangChuoi.index(before: soThuHaiDangChuoi.endIndex))
                  soThuHai = Int(soThuHaiDangChuoi) ?? 0
                  calculate(phepTinh: phepTinh)
                  soThuNhatDangChuoi = ""
                  soThuHaiDangChuoi = ""
              }
        
        if sender.titleLabel?.text! == "+" || sender.titleLabel?.text! == "-" || sender.titleLabel?.text! == "x" || sender.titleLabel?.text! == "/" {
                              if dangOTrangThaiThuHai{
                                  lblResult.text! += sender.titleLabel!.text!
                              }else {
                                  soThuNhatDangChuoi += lblResult.text!
                                  soThuNhatDangChuoi.remove(at: soThuNhatDangChuoi.index(before: soThuNhatDangChuoi.endIndex))
                                  lblResult.text! = ""
                                  soThuNhat = Int(soThuNhatDangChuoi) ?? 0
                                  dangOTrangThaiThuHai = true
                              }
              }
        
        
        
        
    }
    func calculate(phepTinh: String){
        if phepTinh == "+" {
            ketQua = soThuNhat + soThuHai
            lblResult.text! = "\(ketQua)"
        }
        if phepTinh == "-"{
            ketQua = soThuNhat - soThuHai
            lblResult.text! = "\(ketQua)"
        }
        if phepTinh == "x"{
            ketQua = soThuNhat*soThuHai
            lblResult.text! = "\(ketQua)"
        }
        if phepTinh == "/"{
            if (soThuHai == 0){
                lblResult.text! = "Not a number"
            }else{
                ketQua = soThuNhat/soThuHai
                lblResult.text! = "\(ketQua)"
            }
        }
        soThuNhat = ketQua
        dangOTrangThaiThuHai = false
    }
}
   
    


