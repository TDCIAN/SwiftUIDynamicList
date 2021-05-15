//
//  ContentView.swift
//  DynamicList
//
//  Created by APPLE on 2021/05/15.
//

import SwiftUI

struct Stock: Identifiable {
    var id = UUID()
    let title: String
    
}

class StocksViewModel: ObservableObject {
    @Published var stocks: [Stock] = [
        Stock(title: "Apple"),
        Stock(title: "MicroSoft"),
        Stock(title: "Google"),
        Stock(title: "Amazon"),
    ]
}

struct ContentView: View {
    @StateObject var viewModel = StocksViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Add New Stock")) {
                    TextField("CompanyName")
                }
                List {
                    ForEach(viewModel.stocks) { stock in
                        StockRow(title: stock.title)
                    }
                }
            }
            .navigationTitle("Stocks")
        }
    }
}

struct StockRow: View {
    let title: String
    
    var body: some View {
        Label(
            title: { Text(title) },
            icon: { Image(systemName: "chart.bar") }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
