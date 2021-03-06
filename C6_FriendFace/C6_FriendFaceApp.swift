//
//  C6_FriendFaceApp.swift
//  C6_FriendFace
//
//  Created by Jae Cho on 6/7/22.
//

import SwiftUI

@main
struct C6_FriendFaceApp: App {
	@StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
				  .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
