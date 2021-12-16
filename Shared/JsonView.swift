//
//  JsonView.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import SwiftUI

struct JsonView: View {
    @State var response: FeedResponse?
    var body: some View {
        VStack {
            Button("Load feed") {
                Task {
                    do {
                        response = try await NetworkDataProvider.shared.feed()
                    }
                    catch {
                        
                    }
                }
            }
            if let response = self.response {
                Text(response.title ?? "Unknown title")
                if let items = response.items {
                    List() {
                        ForEach (items, id: \.id) { news in
                            HStack {
                                Text("Title")
                                Text(news.title ?? "No title")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            HStack {
                                Text("HTML")
                                Text(news.content_html ?? "No content")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        }
                    }
                } else {
                    Text("No items loaded")
                }
            } else {
                
                Text("Feed not loaded yet")
                Spacer()
            }
        }
    }
    
}

struct JsonView_Previews: PreviewProvider {
    static var previews: some View {
        JsonView()
    }
}
