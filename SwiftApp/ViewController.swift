//
//  TransferListTableController.swift
//  LuckyBet
//
//  Created by nathan on 2019/3/25.
//  Copyright © 2019年 nathan. All rights reserved.
//

import UIKit

private let resuIdentifer = "MyTableViewCell"
class ViewController: UITableViewController {
    
    private var accountModels: [TransferModel] = [];
    
    override init(style: UITableView.Style) {
        super.init(style: style);
        
        for _ in 0...5 {
            let model = TransferModel(code:"", name:"", balance:"aaa");
            accountModels.append(model);
        }
        
        print("accountModels count is: \0", accountModels.count )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        for _ in 0...5 {
            let model = TransferModel(code:"", name:"", balance:"aaa");
            accountModels.append(model);
        }
        
        print("accountModels count is: \0", accountModels.count )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    public var accountModels:[TransferModel]?{
//        didSet{
//            tableView.reloadData()
//        }
//    }
    
    
    private func refreshRoomBalance(type:String,complete:@escaping (_ balance:String)->Void) {
        complete("12321")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\0", accountModels.count )
        return accountModels.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: resuIdentifer, for: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: resuIdentifer)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: resuIdentifer);
        }
        
        var model = accountModels[indexPath.row]
        let balance = model.balance ?? "--"
//        model.update(ba: "test")
        print("{\0}", balance)
        cell?.textLabel?.text = balance
        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        var model = accountModels[indexPath.row]
        refreshRoomBalance(type: model.code ) { (balance) in
            model.update(ba:  balance)
            self.accountModels[indexPath.row] = model
            tableView.reloadData()
        }
    }
}
