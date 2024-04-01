//
//  HomeView.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                ScrollView {
                    LazyVStack(spacing: 25) {
                        ForEach(filteredUsers) { user in
                            NavigationLink {
                                DetailView(id: user.id ?? 0)
                            } label: {
                                userRow(user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
            .refreshable {
                Task {
                    await viewModel.getAllUser()
                }
            }
            .onAppear {
                Task {
                    await viewModel.getAllUser()
                }
            }
        }
    }
    
    private var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.userList
        } else {
            return viewModel.userList.filter { $0.fullName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search People", text: $text)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 5)
        }
    }
}

extension HomeView {
    @ViewBuilder
    func userRow(_ user: User) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.avatar ?? "https://reqres.in/img/faces/2-image.jpg")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading) {
                    Text(user.fullName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
