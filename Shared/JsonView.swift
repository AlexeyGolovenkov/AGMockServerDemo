//
//  JsonView.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import SwiftUI

struct JsonView: View {
    @State var response: FeedResponse?
    @State var hacked: Bool = false
    var body: some View {
        VStack {
            HStack {
                Toggle("Hacked response", isOn: $hacked)
                    .onChange(of: hacked) { value in
                        if hacked {
                            // Remove custom handlers. Mock server will not handle network requests
                            NetworkDataProvider.shared.addHandler()
                        } else {
                            // Lets' set our own hadlers for server request
                            NetworkDataProvider.shared.removeHandler()
                        }
                    }
                Spacer()
                Button("Load feed") {
                    Task {
                        do {
                            response = try await NetworkDataProvider.shared.feed()
                        }
                        catch {
                            // Handle error here
                        }
                    }
                }
            }
            .padding()
            
            if let response = self.response {
                Text(response.title ?? "Unknown title")
                if let items = response.items {
                    List() {
                        ForEach (items, id: \.id) { news in
                            HStack {
                                Text("Title")
                                Text(news.title ?? "No title")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .font(.title)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            HStack {
                                Text("Date")
                                Text(news.date_published ?? "No Date")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            HStack {
                                Text("HTML")
                                    .frame(alignment: .top)
                                Text(news.content_html ?? "No content")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            
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
