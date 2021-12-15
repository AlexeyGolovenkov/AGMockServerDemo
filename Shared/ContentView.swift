//
//  ContentView.swift
//  Shared
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
                .padding()
                NavigationLink(destination: JsonView()) {
                    Text("Json")
                }
                Spacer()
            }
        }
        .frame(width: 800, height: 600, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
