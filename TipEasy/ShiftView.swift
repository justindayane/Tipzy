//
//  ShiftView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//
import SwiftData
import SwiftUI

struct ShiftView: View {
    @Query(sort: [SortDescriptor(\Employee.role)]) var employees: [Employee]
    @State private var showingSelection = false
    @State private var amount = 0.0
    //@State private var selectedStaff: Staff
    //New try
    @State private var shift = Shift()
    
    
    @State private var selectedID = Set<UUID>()
    
    var selectedTeam: [Employee] {
        employees.filter { selectedID.contains($0.id)}
    }
    
    var body: some View {
        NavigationStack {
            Section {
                TextField ("Total amount: ", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            Section {
                List(employees, selection:$selectedID){ member in
                    HStack{
                        Text(member.fname)
                        Spacer()
                        Text(member.role)
                    }
                }
                .environment(\.editMode, .constant(.active)) //permanently in edit mode
                
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
            SelectionView(shift: shift)
        }
        
        Section {
            NavigationLink ("New Shift Selection"){
                SelectionView(shift: shift)
            }
        }
    }
}

#Preview {
    ShiftView()
}
