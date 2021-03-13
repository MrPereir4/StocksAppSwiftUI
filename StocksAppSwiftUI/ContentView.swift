//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by Vinnicius Pereira on 13/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm ) }
        
        return NavigationView{
            
            
            ZStack(alignment: .leading){
                
                Color.black
                
                Text("March 13 2021")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -290)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -240)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 250)
                
                NewsArticlesView(newsArticles: self.stockListVM.news, onDragBegin: { (value) in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { (value) in
                    
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    }else{
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 650)
                    }
                    
                })
                    .animation(.spring())
                    .offset(y: self.stockListVM.dragOffset.height)
            }
            
            
            
            .navigationBarTitle("Stocks")
            .edgesIgnoringSafeArea(Edge.Set(.top))
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
