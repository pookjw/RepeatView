//
//  ContentView.swift
//  RepeatView
//
//  Created by pook on 6/28/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.list, id: \.self) {
                    Text($0 ?? "nil")
                }
            }
            .navigationBarTitle("RepeatView")
            .onAppear {
                viewModel.start()
            }
            .onDisappear {
                viewModel.stop()
                viewModel.list = []
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
