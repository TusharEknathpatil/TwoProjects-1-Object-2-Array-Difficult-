//
//  ApiResponse.swift
//  ApiTestingPart-2
//
//  Created by Mac on 13/05/23.
//

import Foundation

struct ApiResponse {
    var comments:[Comment]
    var total:Int
    var skip:Int
    var limit:Int
}

struct Comment{
    var id:Int
    var body:String
    var postId:Int
    var users:User

}

struct User {
    let id:Int
    var username:String
}
