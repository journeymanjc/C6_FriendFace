//
//  CachedFriend+CoreDataProperties.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/12/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var isAFriendOf: CachedUser?
	
	public var wrappedID: String{
		id ?? "Unknown"
	}
	public var wrappedName: String{
		name ?? "Unknown"
	}

	

}

extension CachedFriend : Identifiable {

}
