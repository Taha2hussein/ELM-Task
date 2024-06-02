//
//  ContentView.swift
//  Elm
//
//  Created by Taha Hussein on 01/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RoutingView(ViewsRoute.self) { router in
            LoginView(router: router)
        }
    }
}

#Preview {
    ContentView()
}
