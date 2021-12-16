//
//  SettingsView.swift
//  AGMockServerDemo
//
//  Created by Alex Golovenkov on 16.12.2021.
//

import SwiftUI

struct SettingsView: View {
    @Binding var hacked: Bool
    var body: some View {
        Text("Hello, Settings View!")
        Toggle("Hacked response", isOn: $hacked)
            .onChange(of: hacked) { value in
                if hacked {
                    NetworkDataProvider.shared.addHandler()
                } else {
                    NetworkDataProvider.shared.removeHandler()
                }
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(hacked: .constant(true))
    }
}
