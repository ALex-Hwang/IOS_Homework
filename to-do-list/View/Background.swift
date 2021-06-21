//
//  Background.swift
//  to-do-list
//
//  Created by alex on 2021/4/28.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
                .ignoresSafeArea()
            Rectangle()
                .rotation(Angle(degrees: 50))
                .foregroundColor(.green)
                .ignoresSafeArea()
        }
 
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
