//
//  EmployeeView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/7/25.
//

import SwiftUI

struct EmployeeView: View {
    var staff: Staff
    @State private var showingAddMember = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(staff.members) { member in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(member.fname)
                                .font(.headline)
                            Text(member.lname)
                        }
                        
                        Spacer()
                        Text(member.role)
                    }
                }
                .onDelete(perform: removeWorker)
            }
            .toolbar {
                Button("Add Member") {
                    showingAddMember = true
                }
            }
            .sheet(isPresented: $showingAddMember) {
                AddView(staff: staff)
            }
        }
    }
    //function used to remove items from a list of ForEach. Could be used to remove staff member from staff of the day or delete staff members permanently after an alert
    func removeWorker(at offset: IndexSet) {
        staff.members.remove(atOffsets: offset)
    }

}

#Preview {
    EmployeeView(staff: Staff())
}
