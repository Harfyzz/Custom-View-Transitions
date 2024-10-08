//
//  FunView.swift
//  MadVision
//
//  Created by Afeez Yunus on 23/09/2024.
//

import SwiftUI

struct FunView: View {
    @State var feedItem: [FeedItem] = []
    var dataservice = DataService()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(feedItem.filter { $0.isFun }) {item in
                    FunComponent(feedItem: item)
                }
            }
        }.scrollIndicators(.hidden)
        .background()
            .onAppear{
                if let loadedItems = dataservice.loadFeedItems() {
                    feedItem = loadedItems // Update the state with the loaded feed items
                }
            }
    }
}

#Preview {
    FunView()
}
