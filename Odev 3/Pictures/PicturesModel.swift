//
//  Model.swift
//  Odev 3
//
//  Created by Joshua Sands on 25.09.2022.
//

import Foundation

struct imageUrl:Decodable{
    var url:URL
}

struct urlUtil{
   
    static var myResponse:[imageUrl] = []
    
    func downloadURL(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if data != nil {
                do{
                    urlUtil.myResponse = try JSONDecoder().decode([imageUrl].self, from: data!)
                    
                }catch{
                    print("Session Error")
                }
            }
        }.resume()
    }
}
