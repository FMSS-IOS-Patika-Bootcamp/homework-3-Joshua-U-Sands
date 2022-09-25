//
//  ViewController.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import UIKit

class PostsVC: UIViewController {

    var gotTitle:[String] = []
    var gotBody:[String] = []
    var gotID:[Int] = []
    var gotUserID:[Int] = []
    
    var changedID:[String] = []
    var changedUserID:[String] = []
    
    @IBOutlet weak var postsTable: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTable.delegate = self
        postsTable.dataSource = self
        
        downloadingPosts().download()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
           
            self.gotTitle = downloadingPosts.myResponse.map({$0.title})
            self.gotBody = downloadingPosts.myResponse.map({$0.body})
            
            self.gotID = downloadingPosts.myResponse.map({$0.id})
            self.changedID = self.gotID.map{String($0)}
            
            self.gotUserID = downloadingPosts.myResponse.map({$0.userId})
            self.changedUserID = self.gotUserID.map{String($0)}
            
            self.postsTable.reloadData()
           
        }
        
        
    }


}

extension PostsVC: UITableViewDelegate{
    
}

extension PostsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! PostsCell
        cell.titleLabel.text = gotTitle[indexPath.row]
        cell.bodyLabel.text = gotBody[indexPath.row]
        cell.idLabel.text = changedID[indexPath.row]
        cell.userIDLabel.text = changedUserID[indexPath.row]
        return cell
    }
    
}
