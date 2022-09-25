//
//  PostsModel.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import Foundation

struct posts:Decodable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
}

struct downloadingPosts{
    
    static var myResponse:[posts] = []
    
    func download(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if data != nil{
                do{
                    downloadingPosts.myResponse = try JSONDecoder().decode([posts].self, from: data!)
                    
                }catch{
                    print("Error Catched")
                }
            }
        }.resume()
    }
}
