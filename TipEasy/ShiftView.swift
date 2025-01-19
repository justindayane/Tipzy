//
//  ShiftView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//

import SwiftUI

struct ShiftView: View {
    @State private var showingSelection = false
    @State private var amount = 0.0
    //@State private var selectedStaff: Staff
    @Bindable var staff: Staff
    //New try
    @State private var shift = Shift()
    
    
    @State private var selectedID = Set<UUID>()
    var selectedTeam: [Employee] {
        staff.members.filter { selectedID.contains($0.id)}
    }
    
    var body: some View {
        NavigationStack {
            Section {
                TextField ("Total amount: ", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            Section {
                List(staff.members, selection:$selectedID){ member in
                    HStack{
                        Text(member.fname)
                        Spacer()
                        Text(member.role)
                    }
                }
                .toolbar {
                    EditButton()
                }
                Text("You selected \(selectedID.count) staff member")
                Button("Staff Selection") {
                    print("shift staff initial -\n \(shift.members)")
                    shift.members = selectedTeam
                    shift.totalCash = amount
                    print("selected Team is -\n \(selectedTeam)")
                    print("shift staff updated to -\n \(shift.members) \n --- Total Cash: $\(amount)")
                    showingSelection = true
                }
                .frame(width: 300, height: 20)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 20))
            }
        }
        .sheet(isPresented: $showingSelection) {
            SelectionView(shift: shift, staff: staff)
        }
        
//        Section {
//            NavigationLink ("New Shift Selection"){
//                SelectionView(shift: shift, staff: staff)
//            }
//        }
    }
}

#Preview {
    ShiftView(staff: Staff())
}
