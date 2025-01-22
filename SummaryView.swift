//
//  SummaryView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/18/25.
//

import SwiftUI

struct SummaryView: View {
    var shift: Shift
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(shift.members) { member in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(member.fname)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            Text(member.role)
                        }
                        Spacer()
                        VStack{
                            Text("$\(Int(member.takeHome))")
                                .font(.title.bold())
                            Text("\(member.hours) hours")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SummaryView(shift: Shift())
}
