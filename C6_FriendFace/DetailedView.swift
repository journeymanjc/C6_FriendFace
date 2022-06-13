//
//  DetailedView.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/10/22.
//

import SwiftUI

struct DetailedView: View {
	var user: CachedUser
    var body: some View {
		 VStack{
			 Text(user.wrappedName)
			 Text(user.wrappedAbout)
			 Text(user.wrappedAddress)
			 Text("\(user.age)")
			 Text(user.wrappedCompany)
			 Text(user.wrappedEmail)
			 ForEach(user.friendArray){ friend in
				 Text(friend.wrappedName)
			 }
			 Text(user.wrappedRegistered)
			 
		 }
		 
    }
}
//
//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//		 DetailedView(user: User(id: "test", isActive: true, name: "test", age: 1, company: "Test", email: "test", address: "test", about: "test", registered: "test", tags: ["test"]))
//    }
//}
