//
//  star.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/6/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct star: View {
    @ObservedObject var filled=starVal()
    var body: some View {
        Image(systemName: self.filled.checked ? "star.fill" : "star")
            .scaleEffect(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
    }
}

struct star_Previews: PreviewProvider {
    static var previews: some View {
        star()
    }
}

class starVal:ObservableObject
{
    @Published var checked=false
}
