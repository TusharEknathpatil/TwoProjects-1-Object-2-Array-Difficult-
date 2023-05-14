//
//  ViewController.swift
//  ApiTestingPart-2
//
//  Created by Mac on 13/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var comments:[Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        testAPi()
    }
    
    func testAPi() {
        guard let url = URL(string: "https://dummyjson.com/comments") else {
            print("Error")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data,response,error in
            
            guard let data = data else {
                print("Data not Found")
                return
            }
            
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data) as! [String:Any]
                
                let eachComment = jsonResponse["comments"] as! [[String:Any]]
                let eachotal = jsonResponse["total"] as! Int
                let eachSkip = jsonResponse["skip"] as! Int
                let eachLimit = jsonResponse["limit"] as! Int
                
                var commentss:[Comment] = []
                
                for eachCommentEtrated in eachComment {
                    let eachId = eachCommentEtrated["id"] as! Int
                    let eachBody = eachCommentEtrated["body"] as! String
                    let eachPost = eachCommentEtrated["postId"] as! Int
                    let EachUsers = eachCommentEtrated["user"] as! [String:Any]
                    
                    let userId = EachUsers["id"] as! Int
                    let username = EachUsers["username"] as! String
                    
                    
                    let userObj = User(id: userId, username: username)
                    
                    let commentObj = Comment(id: eachId, body: eachBody, postId: eachPost, users: userObj)
                    
                    
                    
                    commentss.append(commentObj)
                    
                }
                
                print(commentss.count)
                
                let apiResponse = ApiResponse(comments: commentss, total: eachotal, skip: eachSkip, limit: eachLimit)
                
                print(apiResponse)
                
                   
                }
            
                catch {
                    print("Error")
                    
                }
        }.resume()
            
        }
    }

