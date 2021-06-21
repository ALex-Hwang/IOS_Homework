//
//  TodoDetail.swift
//  to-do-list
//
//  Created by alex on 2021/4/28.
//

import SwiftUI

struct TodoDetail: View {
    let todo: Todo
    
    var body: some View {
        VStack {
            CircleImage(image: Image("test"))
                .offset(y: 80)
                //.padding(.bottom, -200)
            Spacer()
            Text(todo.name!)
                .font(.title)
                .foregroundColor(.primary)
                .padding(.bottom, 20)
            Text(todo.des!)
                .padding(.bottom, 280)
                .font(.caption)
                .foregroundColor(.gray)
        }
        
        
    }
}

/*
struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail()
    }
}

*/
