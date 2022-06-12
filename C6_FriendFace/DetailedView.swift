//
//  DetailedView.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/10/22.
//

import SwiftUI

struct DetailedView: View {
	var user: User
    var body: some View {
		 VStack{
			 Text(user.name)
			 Text(user.about)
			 Text(user.address)
			 Text("\(user.age)")
			 Text(user.company)
			 Text(user.email)
			 ForEach(user.friends){ friend in
				 Text(friend.name)
			 }
			 Text(user.registered)
			 
		 }
		 
    }
}
//
//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//		 DetailedView(user: User(id: "test", isActive: true, name: "test", age: 1, company: "Test", email: "test", address: "test", about: "test", registered: "test", tags: ["test"]))
//    }
//}
