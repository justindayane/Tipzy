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
    var staff: Staff
    
    @State private var selectedID = Set<UUID>()
    var selectedTeam: [Employee] {
        staff.members.filter { selectedID.contains($0.id)}
    }
    
    var body: some View {
        NavigationStack {
            TextField ("Total amount: ", value: $amount, format: .currency(code: "USD"))
                .keyboardType(.decimalPad)
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
                print(selectedTeam)
                showingSelection = true
            }
            .frame(width: 300, height: 20)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.rect(cornerRadius: 20))
            
            
        }
        .sheet(isPresented: $showingSelection) {
            SelectionView(selectedTeam: selectedTeam)
        }
    }
}

#Preview {
    ShiftView(staff: Staff())
}
