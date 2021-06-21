//
//  CircleImage.swift
//  to-do-list
//
//  Created by alex on 2021/5/2.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .frame(width: 300, height: 300)
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("test"))
    }
}

