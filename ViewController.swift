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
/////



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
       let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("AddressCell",forIndexPath: indexPath)
       
        
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

    @IBAction func onSearchbuttonClick(sender: UIButton) { //검색버튼 눌렀을때 호출
        
        let paras : [String:String] = //
            [
                "serviceKey": "ex0TP/ZK4NEE1l6dFzEuRW3kIOemE+ENUaP7XQGsYWHSjB8AMIk5PxnJmBSoBOyTCxMipm8KW6f0MyHTtzJbYA==",//서비스키 디코드한것.
                "searchSe": segment, //
                "srchwrd": searchField.text!, //검색하고싶은 단어 넣는 곳.
                "countPerPage": "10", //한페이지에 몇개까지 볼 수 있게
                "currentPage": "1" //현재 보이고 있는 페이지
        ]
        
        let URL = "http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdService/retrieveNewAdressAreaCdService/getNewAddressListAreaCd" //쿼리 보내기 전까지의 유알엘
        
            
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {//세그가 불리기 전에 먼저 함수 호출을 한다 . 세그는 넘어가는 동작. 뷰가 넘어가는 ㅈ동작
            
            let destinationVC = segue.destinationViewController as! MapViewController //가는 곳의 클래스를 받아온거
            destinationVC.AddressData = ResultArray[segueIndexRow!].lnmAdres
        }
        
        @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            segueIndexRow = indexPath.row
            self.performSegueWithIdentifier("playerSegue", sender: self)
        }

        func Request(url: String, param: [String:String]){
            Alamofire.request(.GET, url, parameters:param).responseObject { (response: Result<NewAddressListSingleResponse,NSError>)in
                
                if let result = response.value {
                    self.ResultArray.append(result.newAddressListAreaCd)
                    self.tableView.reloadData() //갱신
                } else {
                    print("Error")
                }
            }
            
        }


}











































 