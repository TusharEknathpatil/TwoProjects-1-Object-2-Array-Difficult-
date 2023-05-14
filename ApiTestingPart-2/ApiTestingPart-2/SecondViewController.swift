//
//  SecondViewController.swift
//  ApiTestingPart-2
//
//  Created by Mac on 14/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    var users:[UserId] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
    }
    func fetchData() {
        guard let url = URL(string: "https://fakestoreapi.com/carts?userId=1") else {return}
        
        URLSession.shared.dataTask(with: url) {
            Data,response,error in
            
            guard let data = Data else { return }
            
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data) as! [[String:Any]]
                
                for eachUser in jsonArray {
                    let eachUserss = eachUser as! [String:Any]
                    let eachId = eachUserss["id"] as! Int
                    let eachUserId = eachUserss["userId"] as! Int
                    let eachDate = eachUserss["date"] as! String
                    let eachProduct = eachUserss["products"] as! [[String:Any]]
                    let each__v = eachUserss["__v"] as! Int
                    
                    var productAppend:[Product] = []
                    for eachProductiterate in eachProduct {
                        
                        let productRemoveBracket = eachProductiterate as! [String:Any]
                        let eachProductId = productRemoveBracket["productId"] as! Int
                        let eachQuantity = productRemoveBracket["quantity"] as! Int
                        
                        
                        var productAppendArray = Product(productId: eachProductId, quantity: eachQuantity)
                        productAppend.append(productAppendArray)
                        
                    }
                    let userAppend = UserId(id: eachId, userId: eachUserId, date: eachDate, products: productAppend, __v: each__v)
                    
                    self.users.append(userAppend)
                }
            }
            
            
            
            
            catch {
                print("Error")
            }
            
            print(self.users.self)
            print(self.users.count)
           
        }.resume()
        
        
        
        
        
    }
}
