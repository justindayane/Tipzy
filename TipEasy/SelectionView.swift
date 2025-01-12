//
//  SelectionView.swift
//  TipEasy
//
//  Created by Justin Dayane  Gbadamassi on 1/8/25.
//

import SwiftUI

struct SelectionView: View {
    
    var selectedTeam: [Employee]
    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(selectedTeam.indices, id:\.self) { i in
                    HStack{
                        Text(selectedTeam[i].fname)
                        Spacer()
                        Text("\(selectedTeam[i].hours) hrs")
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    SelectionView(selectedTeam: [Employee]())
}
