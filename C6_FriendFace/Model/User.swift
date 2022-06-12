//
//  User.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/7/22.
//

import Foundation

struct User: Codable, Hashable, Identifiable{
	var id: String
	var isActive: Bool
	var name: String
	var age: Int
	var company: String
	var email: String
	var address: String
	var about: String
	var registered: String
	var tags: [String]
	var friends: [Friend]
}
