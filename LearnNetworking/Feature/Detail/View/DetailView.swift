//
//  DetailView.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 05/03/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    @State var username = ""
    
    var id: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            AsyncImage(url: URL(string: viewModel.user?.avatar ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Name: \(viewModel.user?.id ?? 0)")
                    .fontWeight(.bold)
                Text("Name: \(viewModel.user?.fullName ?? "")")
                    .fontWeight(.bold)
                Text("Email: \(viewModel.user?.email ?? "")")
                    .fontWeight(.bold)
            }
            Spacer()
            
        }
        .onAppear {
            viewModel.getSingleUser(id: id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
