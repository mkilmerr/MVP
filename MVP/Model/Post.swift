//
//  Post.swift
//  MVP
//
//  Created by Marcos Kilmer Pereira de Aquino on 25/11/21.
//

import Foundation

struct Post: Decodable {
  let userId:Int
  let id: Int
  let title: String
  let body: String
}
