//
//  CachedUser+CoreDataProperties.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/12/22.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int32
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var hasFriend: NSSet?
	
	public var wrappedID: String{
		id ?? "Unknown ID"
	}
	public var wrappedName: String{
		name ?? "Unknown Name"
	}
	public var wrappedCompany: String{
		company ?? "Unknown Company"
	}
	public var wrappedEmail: String{
		email ?? "Unknown Email"
	}
	public var wrappedAddress: String{
		address ?? "Unknown Address"
	}
	public var wrappedAbout: String{
		about ?? "Unknown About"
	}
	public var wrappedRegistered: String{
		registered ?? "Unknown Registered Date"
	}
	public var wrappedTags: String{
		tags ?? "Unknown Tags"
	}

	public var friendArray: [CachedFriend] {
		let set = hasFriend as? Set<CachedFriend> ?? []
		
		return set.sorted{
			$0.wrappedName > $1.wrappedName
		}
	}
	

}

// MARK: Generated accessors for hasFriend
extension CachedUser {

    @objc(addHasFriendObject:)
    @NSManaged public func addToHasFriend(_ value: CachedFriend)

    @objc(removeHasFriendObject:)
    @NSManaged public func removeFromHasFriend(_ value: CachedFriend)

    @objc(addHasFriend:)
    @NSManaged public func addToHasFriend(_ values: NSSet)

    @objc(removeHasFriend:)
    @NSManaged public func removeFromHasFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
