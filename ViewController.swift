//
//  ViewController.swift
//  TermProject
//
//  Created by kpu on 2016. 5. 28..
//  Copyright © 2016년 SUNGJUN CHO. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireXmlToObjects
import EVReflection
import XMLDictionary

class cmmMsgHeaderCls : EVObject{
    var requestMsgId : String?
    var responseMsgId : String?
    var responseTime : String?
    var successYN : String?
    var returnCode : String?
    var errMsg : String?
    var totalCount : String?
    var countPerPage : String?
    var totalPage : String?
    var currentPage : String?
}

class NewAddressListResponse : EVObject{
    var cmmMsgHeader : cmmMsgHeaderCls = cmmMsgHeaderCls()
    var newAddressListAreaCd: [NewAddressListAreaCdCls] = [NewAddressListAreaCdCls]()
}

class NewAddressListSingleResponse : EVObject{
    var cmmMsgHeader : cmmMsgHeaderCls = cmmMsgHeaderCls()
    var newAddressListAreaCd: NewAddressListAreaCdCls = NewAddressListAreaCdCls()
}

class NewAddressListAreaCdCls : EVObject{
    var zipNo : String?
    var lnmAdres : String?
    var rnAdres : String?
}




class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var searchField: UITextField! // 텍스트 입력받는 부분.
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var ResultHeader: cmmMsgHeaderCls!
    var ResultArray: [NewAddressListAreaCdCls] = [NewAddressListAreaCdCls]() // 주소 결과 저장위해
   
    var segment : String = "dong"
    var segueIndexRow : Int? //내가 받아온 검색해서 나온 결과들을 클릭을 해서 맵을 찾아야 되는데, 몇번째 테이블뷰인지를 인덱스값에 저장하는거
    override func viewDidLoad() {
        super.viewDidLoad()
        //EVReflection.setBundleIdentifier(NewAddressListAreaCdCls)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResultArray.count //테이블뷰 전체에 몇개의 요소가 들어가는지 결정하려고 씀
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //각셀에 들어갈 내용을 결정하는 함수.
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
       
        
        let zipNo = ResultArray[indexPath.row].zipNo
        let lnmAdres = ResultArray[indexPath.row].lnmAdres // 도로명주소
        let rnAdres = ResultArray[indexPath.row].rnAdres // 지번주소
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.textLabel?.text = "우편번호 : " + zipNo! + "\n지번주소 : " + lnmAdres! + "\n도로명 주소 : " + rnAdres!
        return cell
    }

    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            segment = "dong"; 
        case 1:
            segment = "road";
        case 2:
            segment = "post";
        default:
            break;
        }
    
}

 