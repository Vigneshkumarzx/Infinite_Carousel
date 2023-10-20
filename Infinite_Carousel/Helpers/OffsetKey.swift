//
//  OffsetKey.swift
//  Infinite_Carousel
//
//  Created by vignesh kumar c on 20/10/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
   
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offSetX(_ addObserver: Bool ,completion: @escaping (CGRect) -> ()) -> some View {
        self
            .frame(width: .infinity)
            .overlay {
                if addObserver {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        
                        Color.clear
                            .preference(key: OffsetKey.self, value: rect)
                            .onPreferenceChange(OffsetKey.self, perform: completion)
                    }
                }
            }
    }
}
