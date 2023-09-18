//
//  ContentView.swift
//  cmon
//
//  Created by Eva Martinez on 4/9/23.
//

import SwiftUI
import Foundation

struct candid: Hashable, Identifiable {
    var name: String
    var descrip: String
    var votes: Int
    var id = UUID()
}

struct ContentView: View {
    
    @State var a: Array<String> = ["","",""]
    @State var ind: Int
    @State var candidates = [candid(name: "a", descrip: "a", votes: 1),candid(name: "egg", descrip: "average how to basic video", votes: 15),candid(name: "pumpkin soup (not lava i promise)", descrip: "soop", votes: 31)]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(0..<candidates.count, id: \.self){ i in
                    NavigationLink(destination:
                                    VStack{
                        Text("Name: \(candidates[i].name)\nDescription: \(candidates[i].descrip)\nNum of votes: \(candidates[i].votes)")
                        Stepper("Add votes: ", value: $candidates[i].votes)
                            .padding(.horizontal)
                    }){
                        Text("\(i+1): \(candidates[i].name)")
                    }
                }
            }
            .navigationTitle("Voting Candidates")
            List{
                TextField("New candidate Name: ", text: $a[0])
                TextField("New candidate Description: ", text: $a[1])
                TextField("New candidate Number of votes: ", text: $a[2])
                HStack{
                    Button{
                        candidates.append(candid(name: a[0], descrip: a[1], votes: Int(a[2]) ?? 0))
                    } label: {
                        Text("Add")
                    }
                    Button{
                        let spag = candid(name: a[0], descrip: a[1], votes: Int(a[2]) ?? 0)
                        if let index = candidates.firstIndex(of: spag){
                            candidates.remove(at: index)
                        }
                    } label: {
                        Text("Delete")
                    .padding(.horizontal)
                    .padding(.leading)
                    .padding(.leading)

                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(a: ["","",""], ind: 0)
    }
}
