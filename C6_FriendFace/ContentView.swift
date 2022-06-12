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
    var body: some View {
		 NavigationView{
			 
			 List(users, id: \.id){ user in
				 HStack{
					 NavigationLink{
						 DetailedView(user: user)
					 } label: {
						 Text(user.name)
					 }
					 
					 Spacer()
					 
					 Text(user.isActive ? "ACTIVE" : "NOT ACTIVE")
						 .font(.system(size: 10.0))
				 }
			 }
		 }
		.padding()
		.task{
			if users.isEmpty{
				await loadData()
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
