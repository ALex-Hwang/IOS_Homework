//
//  AddItem.swift
//  to-do-list
//
//  Created by alex on 2021/4/28.
//

import SwiftUI

struct AddItem: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    static let DES: String = "Default"
    static let NAME: String = "Default"
    
    @State var name: String = ""
    @State var des: String = ""
    //@State var createDate: Date = Date()
    @State var expireDate: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("description")) {
                    TextField("Description", text: $des)
                }
                Section {
                    DatePicker(
                        selection: $expireDate,
                        displayedComponents: .date) {
                        Text("Deadline").foregroundColor(.gray)
                    }
                }
                Section {
                    Button(action: {
                        let newItem = Todo(context: viewContext)
                        newItem.name = self.name.isEmpty ? AddItem.NAME: self.name
                        newItem.des = self.des.isEmpty ? AddItem.DES: self.des
                        newItem.createDate = Date()
                        newItem.expireDate = self.expireDate
                        newItem.id = UUID()
                        
                        do {
                            try viewContext.save()
                            print("Item saved.")
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Add Item")
                    }
                }
            }
            .navigationBarTitle(Text("Add Item"), displayMode: .inline)
        }
    }
    
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}

