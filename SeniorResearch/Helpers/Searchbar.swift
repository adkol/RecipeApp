//
//  Searchbar.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 10/8/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct Searchbar: View {
    @State var searchitem:String;
    var body: some View {
        ZStack{
            TextField("Search...",text:$searchitem)
                .padding()
       
            HStack{
                Image(systemName: "magnifyingglass")
                    .scaleEffect(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)

                    .colorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
    }
}

struct Searchbar_Previews: PreviewProvider {
    static var previews: some View {
        Searchbar(searchitem: "")
    }
}
