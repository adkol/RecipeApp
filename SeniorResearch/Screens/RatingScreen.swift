//
//  RatingScreen.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/6/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

var opacity=0.0
struct RatingScreen: View {
    @State var rating = -1
    @State var uploadData=RatingUpload(rating:-1)
    @State var title:String
    @State var rstars=RatingStars()
    @State var feedbacksent=false
    @State var container:recipe_detail
    @State var size : CGFloat = UIScreen.main.bounds.width
    var body: some View {
      NavigationView{
        ZStack{
            StyleData.faintYellow.edgesIgnoringSafeArea(.all)
      
        VStack{
            Text("Rate Your Experience:")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 80.0)
            rstars
                .scaleEffect(/*@START_MENU_TOKEN@*/1.2/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 40.0)
            
                NavigationLink(destination:home().navigationBarBackButtonHidden(true),isActive: $feedbacksent){
            Button(action:{
                self.uploadData=RatingUpload(rating: self.rating)
                self.rating=self.rstars.rating.rating
                print(self.rating)
                //self.feedbacksent=true
                self.container.size2=self.size
                self.sendData()
            })
            {
                Text("Send")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            }
            .frame(width: 82.0, height: 36.0)
            .background(StyleData.defaultYellow)
            .cornerRadius(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                }
            
            Spacer()
            .frame(height: 80.0)
            Text("Thank you!")
            .font(.title)
            .fontWeight(.bold)
        }
        }
        
    }
    }
    func sendData()
    {
        let array = self.title.components(separatedBy: " ")
        var ntitle=""
        for word in array
        {
            ntitle=ntitle+word+"%20";
        }
        ntitle = String(ntitle.prefix(ntitle.count))
        print("loading")
        guard let url = URL(string: "https://senior-research-akoll.sites.tjhsst.edu/ratings/?recipe="+ntitle+"&rating=\(self.rating)") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print("success")
                print(data)
                if let decodedResponse = try? JSONDecoder().decode(RatingData.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        print(decodedResponse.results[0].count)
                    }

                    // everything is good, so we can exit
                    return
                }
                else{
                    print("It didn't work >(")
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

//struct RatingScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingScreen(title: "Butternut Squash Soup", container: recipe_detail(title: "Recipe Name", time: 5, ingredients: ["Ingredient 1","Ingredient 2","Ingredient 3","Ingredient 4"], Instructions: "Cook bacon in a 6-quart heavy pot over medium heat, stirring occasionally, until crisp, then transfer with a slotted spoon to paper towels to drain, reserving 2 tablespoons fat in pot. (Add vegetable oil if your bacon is very lean and doesn't yield enough fat.)Cook celery, carrot, and onion in fat in pot over low heat, covered, stirring occasionally, until softened but not browned, 10 to 12 minutes. Add cinnamon and cook, uncovered, stirring, 1 minute.While vegetables are cooking, peel potatoes and coarsely chop. Peel and core 1 apple and coarsely chop.Stir squash, potato, chopped apple, stock, 2 cups water, 1 teaspoon salt and 1/2 teaspoon pepper into onion mixture, then simmer, uncovered, stirring occasionally, until vegetables are very tender, 15 to 20 minutes.Puree soup in 4 batches in a blender (use caution when blending hot liquids), then heat in cleaned pot over medium low heat, stirring occasionally. (Add additional 1/2 cup water to thin, if necessary.)While soup is heating, cut enough of remaining apple into thin matchsticks (about 1 1/2-inches long) to measure about 1/2 cup.Serve soup topped with sour cream, bacon, and apple matchsticks.Cooks' Notes: Soup can be made 2 days ahead and chilled, covered once cooled. Cooked bacon can be kept refrigerated in an airtight container—reheat in a 375°F oven in a small baking pan.", image: Image("background_color.png"), container: recipe_view(title: "", ingredients: [""], instructions: "", image_link: "")))
//    }
//}
