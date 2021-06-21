//
//  test.swift
//  to-do-list
//
//  Created by alex on 2021/4/27.
//

import SwiftUI

struct test: View {
    @State private var msg = "test"
    var body: some View {
        NavigationView {
            List {
                Text(msg)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: changeMsg) {
                        Label("change", systemImage: "plus")
                    }
                }
                
            }
        }
    }
    
    private func changeMsg() {
        msg = "change"
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
