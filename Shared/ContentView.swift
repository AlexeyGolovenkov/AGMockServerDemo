//
//  ContentView.swift
//  Shared
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var hacked = false
    var body: some View {
        JsonView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
