//
//  home.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 11/27/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct home: View {
    @State var size : CGFloat = UIScreen.main.bounds.height - 130
    var body: some View {
        ZStack{
            StyleData.faintYellow.edgesIgnoringSafeArea(.all)
        VStack{
            Text("Welcome! Swipe to explore recipes!")
                .font(.headline)

        }
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
