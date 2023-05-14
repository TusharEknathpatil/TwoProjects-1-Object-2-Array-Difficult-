//
//  UserId.swift
//  ApiTestingPart-2
//
//  Created by Mac on 14/05/23.
//

import Foundation

struct UserId {
    var id:Int
    var userId:Int
    var date:String
    var products:[Product]
    var __v:Int
}

struct Product{
    var productId:Int
    var quantity:Int
}
