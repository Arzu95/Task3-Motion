//
//  ContentView.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
