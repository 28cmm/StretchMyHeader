//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Yilei Huang on 2019-02-19.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UIScrollViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath as IndexPath) as! defaultTC2
        let index = infoList[indexPath.row]
        cell.subtitle!.text = index.detail
        cell.titleLabel!.text = index.name
       
        cell.titleLabel.textColor = index.color
        
        return cell
    }
    struct Headline{
        var name:String
        var color:UIColor
        var detail:String

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }

    @IBOutlet weak var headerView: UIView!
    
    
    var infoList = [Headline]()
    private var kTableHeaderHeight: CGFloat!
    private let kTableHeaderCutAway: CGFloat = 80.0
    var hheaderMaskLayer: CAShapeLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44.0
        kTableHeaderHeight = headerView.frame.height
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset.y -= kTableHeaderHeight
        
        hheaderMaskLayer = CAShapeLayer()
        headerView.layer.mask = hheaderMaskLayer
//        headerView.layer = UIColor.red
        updateHeaderView()
        
        
        
        dateLabel.text = createDate()
        let word = Headline(name: "World", color: UIColor.red, detail: "Climate change protests, divestments meet fossil fuels realities")
        infoList.append(word)
        
        let Europe = Headline(name: "Europe", color: UIColor.green, detail: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime")
        infoList.append(Europe)
        
        let MiddleEast = Headline(name: "Middle East", color: UIColor.yellow, detail: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        infoList.append(MiddleEast)
        
        let Africa = Headline(name: "Africa", color: UIColor.orange, detail: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        infoList.append(Africa)
        
        let AsiaPacific = Headline(name: "Asia Pacific", color: UIColor.purple, detail: "Despite UN ruling, Japan seeks backing for whale hunting")
        infoList.append(AsiaPacific)
        
        let America = Headline(name: "America", color: UIColor.blue, detail: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        infoList.append(America)
        
        
        let world2 = Headline(name: "world", color: UIColor.red, detail: "South Africa in $40 billion deal for Russian nuclear reactors")
        infoList.append(world2)
        
        let Europe2 = Headline(name: "Europe", color: UIColor.green, detail: "One million babies' created by EU student exchanges")
        infoList.append(Europe2)
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: tableView.frame.origin.x, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight{
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        hheaderMaskLayer?.path = path.cgPath
        hheaderMaskLayer?.fillColor = UIColor.gray.cgColor
        
    }
    func createDate()->String{
        let dateFromate = DateFormatter()
        dateFromate.dateFormat = "MMMM d"
        let date = dateFromate.string(from:Date())
        
        return date
    }
    

    
    
    
  


}

