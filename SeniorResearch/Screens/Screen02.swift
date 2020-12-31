//
//  Screen02.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 10/8/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct Screen02: View {
    @State var searchitem="";
    var body: some View {
        VStack{
            TextField("Search...",text:$searchitem)
                .padding()
            Spacer()
        }
    }
}

struct Screen02_Previews: PreviewProvider {
    static var previews: some View {
        Screen02()
    }
}
