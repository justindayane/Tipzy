//
//  AddView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/7/25.
//

import SwiftUI

struct AddView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var role = "Server"
    @Environment(\.dismiss) var dismiss
    
    var staff: Staff
    
    let roles = ["Server", "Bartender", "Runner", "Barback"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("First Name:", text: $firstName)
                    TextField("Last Name:", text: $lastName)
                    Picker("Role:", selection: $role) {
                        ForEach(roles, id:\.self) {
                            Text($0)
                        }
                    }
                }
                Button("Done") {
                    dismiss()
                }
                
            }
            .navigationTitle("Add new member")
            .toolbar {
                Button("Add") {
                    let member = Employee(fname: firstName, lname: lastName, role: role)
                    staff.members.append(member)
                    firstName = ""
                    lastName = ""
                }
            }
        }
    }
}


#Preview {
    AddView(staff: Staff())
}
