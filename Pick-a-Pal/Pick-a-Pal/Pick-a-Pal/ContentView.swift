//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Monami Kirjavainen on 23.3.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    var body: some View {
        VStack {
            VStack(spacing: 8){
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.accentColor1)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.accentColor1)
            
            List{
                ForEach(names, id: \.description) {name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius:  8))
            
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty{
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemovePickedName{
                        names.removeAll{ name in
                            name == pickedName
                        }
                    }
                } else{
                    pickedName = ""
                }
            } label: {
                Text("Picke Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
