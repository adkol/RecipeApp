//
//  Screen01.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 10/8/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct Screen01: View {
    var body: some View {
        VStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Register")
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 9.0)
                    .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
            Button(action: {}) {
            Text("Login")
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Continue as guest")
                    .foregroundColor(Color.black)
            }
        }
    }
}

struct Screen01_Previews: PreviewProvider {
    static var previews: some View {
        Screen01()
    }
}
