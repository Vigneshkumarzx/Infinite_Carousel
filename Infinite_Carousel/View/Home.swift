//
//  Home.swift
//  Infinite_Carousel
//
//  Created by vignesh kumar c on 20/10/23.
//

import SwiftUI

struct Home: View {
    
    @State private var currentPage: String = ""
    @State private var listOfPages: [Page] = []
    
    @State private var fakedPage: [Page] = []
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            TabView(selection: $currentPage,
                    content:  {
                ForEach(fakedPage) { page in
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(page.color.gradient)
                        .frame(width: 300, height: size.height)
                        .tag(page.id)
                        .offSetX(currentPage == page.id) { rect in
                            let minX = rect.minX
                            let pageOffset = minX - (size.width * CGFloat(fakeIndex(page)))
                            let pageProgress = pageOffset / size.width
//                            
//                            if -pageProgress < 1.0 {
//                                currentPage = fakedPage[fakedPage.count - 1].id
//                            }
                            

                        }
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .frame(height: 400)
        .onAppear{
            for color in [Color.blue, Color.brown, Color.red, Color.green, Color.orange]  {
                listOfPages.append(.init(color: color))
            }
            fakedPage.append(contentsOf: listOfPages)
            
            if var firstPage = listOfPages.first, var lastPage = listOfPages.last {
                firstPage.id = .init()
                lastPage.id = .init()
                
                currentPage = firstPage.id
                
                fakedPage.append(firstPage)
                fakedPage.insert(lastPage, at: 0)
            }
        }
    }
    
    func fakeIndex(_ of: Page) -> Int {
        return fakedPage.firstIndex(of: of) ?? 0
    }
}

#Preview {
    Home()
}
