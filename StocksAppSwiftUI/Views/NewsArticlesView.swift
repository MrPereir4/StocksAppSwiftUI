//
//  NewsArticlesView.swift
//  StocksAppSwiftUI
//
//  Created by Vinnicius Pereira on 13/03/21.
//

import SwiftUI

struct NewsArticlesView: View {
    
    let newsArticles: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
            VStack(alignment: .leading) {
                
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                   
                
                Text("From News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                }
                
                Spacer()
                }
                .padding().contentShape(Rectangle())
                .gesture(DragGesture()
                        .onChanged(self.onDragBegin)
                        .onEnded(self.onDragEnd))
                
                ScrollView {
                    VStack {
                        ForEach(self.newsArticles, id: \.title) { article in
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial",size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color.white)
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }.frame(maxWidth: .infinity)
                }
                
                
            
            
        }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title", imageURL: "https://s2.best-wallpaper.net/wallpaper/5120x2880/1902/News-orange-background-creative-picture_5120x2880.jpg", publication: "The WallStreet Journal")
        
        return NewsArticlesView(newsArticles: [NewsArticleViewModel(article: article)], onDragBegin: { _ in}, onDragEnd: { _ in})
    }
}
