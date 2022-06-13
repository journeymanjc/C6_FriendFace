//
//  ContentView.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/7/22.
//

import SwiftUI


class FriendFaceUser: ObservableObject{
	@Published var users: [User] = []
}


struct ContentView: View {
	
	@State private var users = FriendFaceUser().users
	
	@Environment(\.managedObjectContext) var moc
	@FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
	
    var body: some View {
		 NavigationView{
			 
//			 List(users, id: \.id){ user in
//				 HStack{
//					 NavigationLink{
//						 DetailedView(user: user)
//					 } label: {
//						 Text(user.name)
//					 }
//
//					 Spacer()
//
//					 Text(user.isActive ? "ACTIVE" : "NOT ACTIVE")
//						 .font(.system(size: 10.0))
//				 }
//			 }
			 List{
				 ForEach(cachedUsers, id: \.self) { user in
					 NavigationLink{
						 DetailedView (user: user)
					 } label: {
						 Text(user.wrappedName)
					 }
					 
				 }
			 }
		 }
		.padding()
		.task{
			if users.isEmpty{
				//after loading the data need to save to CoreData
				await loadData()
				
				//Lets save to core data here
				await MainActor.run{
					for user in users{
						let newCoreDataEntry = CachedUser(context: moc)
						newCoreDataEntry.id = user.id
						newCoreDataEntry.name = user.name
						newCoreDataEntry.isActive = user.isActive
						newCoreDataEntry.age = Int32(user.age)
						newCoreDataEntry.company = user.company
						newCoreDataEntry.email = user.email
						newCoreDataEntry.address = user.address
						newCoreDataEntry.about = user.about
						newCoreDataEntry.registered = user.registered
						let tagString = user.tags.joined(separator: ",")
						newCoreDataEntry.tags = tagString
						
						for eachFriend in user.friends{
							let newCoreFriendEntry = CachedFriend(context: moc)
							newCoreFriendEntry.isAFriendOf = newCoreDataEntry
							newCoreFriendEntry.id = eachFriend.id
							newCoreFriendEntry.name = eachFriend.name
							
						}
						try? moc.save
					}
						
				}
			}
		}
    }
	
	func loadData() async {
		guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
			print("Invalid URL")
			return
		}
		do {
			let(data, _) = try await URLSession.shared.data(from: url)
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601
			if let decodedResponse = try? decoder.decode([User].self, from: data) {
				users = decodedResponse
			}
		} catch {
			print("Invalid data")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









