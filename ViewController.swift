


import UIKit


class ViewController: UIViewController, UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView! // 검색해서 나온 결과물을 드래그해서 볼 수 있은 것
      override func viewDidLoad() {
        super.viewDidLoad()
        //EVReflection.setBundleIdentifier(NewAddressListAreaCdCls)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return ResultArray.count //테이블뷰 전체에 몇개의 요소가 들어가는지를 결정.
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //각셀에 들어갈 내용을 결정하는 함수.
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("AddressCell",forIndexPath: indexPath)
    
 
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        /*
        cell.textLabel?.text = "우편번호 : " + zipNo! + "\n지번주소 : " + lnmAdres! + "\n도로명 주소 : " + rnAdres! // 내가 받아온 정보를 표시해주는 것. 셀에 표시.
        */
        
        cell.textLabel?.text = "맛집 10선"
        
        return cell
    }
 
    override func didReceiveMemoryWarning() {//메모리 부족할 때 불리는함수
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // segueIndexRow = indexPath.row // 1번
        self.performSegueWithIdentifier("playerSegue", sender: self) //2번
    }
    
 
}

