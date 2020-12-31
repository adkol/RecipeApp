//
//  RatingStars.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/6/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct RatingStars: View {
    @State var star1=star()
    @State var star2=star()
    @State var star3=star()
    @State var star4=star()
    @State var star5=star()
    @State var rating = ratingVal()
    @State var rated=false
    var body: some View {
        HStack{
        Button(action:{
            self.rating.rating=1
            self.rated=true
            self.star1.filled.checked=true
            print(self.rating)
            self.star2.filled.checked=false
            self.star3.filled.checked=false
            self.star4.filled.checked=false
            self.star5.filled.checked=false
        })
        {
            self.star1
                .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
        }
            Spacer().frame(width: 26.0)
            Button(action:{
                self.rating.rating=2
                self.rated=true
                self.star1.filled.checked=true
                self.star2.filled.checked=true
                self.star3.filled.checked=false
                self.star4.filled.checked=false
                self.star5.filled.checked=false
            })
            {
                self.star2.accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            }
            Spacer().frame(width: 26.0)
            Button(action:{
                self.rating.rating=3
                self.rated=true
                self.star1.filled.checked=true
                self.star2.filled.checked=true
                self.star3.filled.checked=true
                self.star4.filled.checked=false
                self.star5.filled.checked=false
            })
            {
                self.star3.accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            }
            Spacer().frame(width: 26.0)
            Button(action:{
                self.rating.rating=4
                self.star1.filled.checked=true
                self.rated=true
                self.star2.filled.checked=true
                self.star3.filled.checked=true
                self.star4.filled.checked=true
                self.star5.filled.checked=false
            })
            {
                self.star4.accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            }
            Spacer()
                .frame(width: 26.0)
            Button(action:{
                self.rating.rating=5
                self.star1.filled.checked=true
                self.star2.filled.checked=true
                self.rated=true
                self.star3.filled.checked=true
                self.star4.filled.checked=true
                self.star5.filled.checked=true
            })
            {
                self.star5.accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct RatingStars_Previews: PreviewProvider {
    static var previews: some View {
        RatingStars()
    }
}

class ratingVal:ObservableObject
{
    @Published var rating = -1
}
