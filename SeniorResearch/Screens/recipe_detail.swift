//
//  recipe_detail.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 11/19/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct recipe_detail: View {
    var title:String;
    var time: Int
    var ingredients: [String]
    var Instructions: String
    var image: Image
    @State var container:recipe_view
    @State var size : CGFloat = UIScreen.main.bounds.width
     @State var size2 : CGFloat = UIScreen.main.bounds.width
    var body: some View {
        ZStack{
        ZStack{
            StyleData.faintYellow.edgesIgnoringSafeArea(.all)

            image
            .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                Spacer()
        
            VStack{
                VStack{
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
                    }
              //  }
            Spacer()
                .frame(height: 20.0)
            ScrollView{

            HStack
                {
                    VStack{
                        HStack{
                        VStack{
            Text("Ingredients:")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 39.0)
            ForEach(values: ingredients) { ingredient in
                Text(ingredient)
                    .foregroundColor(StyleData.darkGray)
            
            }
                            Spacer().frame(height: 70)
            
            Text("Instructions:")
                             .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                             .padding(.trailing, 39.0)
                       
                          
                            }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            Spacer()
        VStack(spacing: 12.0){
        ForEach(values: Instructions.components(separatedBy: ". ")) { instruction in
            Text("\(instruction).")
                .font(.body)
                .foregroundColor(StyleData.darkGray)
                .opacity(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                
            }
                        }
                        }
            }
            }
            Spacer()
            Spacer()
            }
  
    }
            }  .gesture(DragGesture()
                          .onChanged({value in
                              print(value)
                              print("Changing...")
                              let temp = UIScreen.main.bounds.width
                            if(value.translation.width>0){
                            self.container.size = temp + value.translation.width
                            }
//                            if(self.size2>0 && value.translation.width>0){
//                                self.size2 = temp + value.translation.width
//                            }
//                            if(self.size2==0){
//                                  self.size2 = temp + value.translation.width
//                              }
                               self.size2 = temp + value.translation.width
                              
                          })
                          .onEnded({value in
                              print("ended")

                              if value.translation.width > 0{
                                  
                                  if value.translation.width > 200{
//
                                    self.container.size = UIScreen.main.bounds.width
                                     self.size2 = UIScreen.main.bounds.width
                                    
                                      print("Detail:Went to previous screen")
                                    self.container.container.onParent=true
                                      
                                  }
                                  else{
//                                      self.size2 = 0
//                                    self.size2 = UIScreen.main.bounds.width
//                                    self.container.container.onParent=true
                                    //self.currIndex += 1
                                    
                                    
                                }
                              }
                              else{
                                if value.translation.width < -200{
                                    
//                                    self.container.size = UIScreen.main.bounds.width
                                    self.size2 = 0
//                                    print("Detail:Went to the previous screen")
                                    
                                    print("Detail: \(value.translation.width)")

//                                    self.container.container.onParent=true
                                    
                                }
                                else{
                                    
                                    self.size2 = 0
                                    print("Detail:went to next screen")
                                    self.container.size=0
                                    self.container.container.onParent=true
                                     // self.currIndex += -1
                                      
                                  }
                              }
                              
                          })
                  
                      )
                          .animation(.spring())
            
            RatingScreen(title: self.title, container: self).offset(x:self.size2)
        }
    }
}
extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
    init(values: Data, content: @escaping (Data.Element) -> Content) {
        self.init(values, id: \.self, content: content)
    }
}
func split_String(instr:String) -> [String]
{
    let toret=instr.components(separatedBy: ". ")
    return toret
}

//struct recipe_detail_Previews: PreviewProvider {
//    static var previews: some View {
//        recipe_detail(title: "Recipe Name", time: 5, ingredients: ["Ingredient 1","Ingredient 2","Ingredient 3","Ingredient 4"], Instructions: "Cook bacon in a 6-quart heavy pot over medium heat, stirring occasionally, until crisp, then transfer with a slotted spoon to paper towels to drain, reserving 2 tablespoons fat in pot. (Add vegetable oil if your bacon is very lean and doesn't yield enough fat.)Cook celery, carrot, and onion in fat in pot over low heat, covered, stirring occasionally, until softened but not browned, 10 to 12 minutes. Add cinnamon and cook, uncovered, stirring, 1 minute.While vegetables are cooking, peel potatoes and coarsely chop. Peel and core 1 apple and coarsely chop.Stir squash, potato, chopped apple, stock, 2 cups water, 1 teaspoon salt and 1/2 teaspoon pepper into onion mixture, then simmer, uncovered, stirring occasionally, until vegetables are very tender, 15 to 20 minutes.Puree soup in 4 batches in a blender (use caution when blending hot liquids), then heat in cleaned pot over medium low heat, stirring occasionally. (Add additional 1/2 cup water to thin, if necessary.)While soup is heating, cut enough of remaining apple into thin matchsticks (about 1 1/2-inches long) to measure about 1/2 cup.Serve soup topped with sour cream, bacon, and apple matchsticks.Cooks' Notes: Soup can be made 2 days ahead and chilled, covered once cooled. Cooked bacon can be kept refrigerated in an airtight container—reheat in a 375°F oven in a small baking pan.", image: Image("background_color.png"), container: recipe_view(title: "", ingredients: [""], instructions: "", image_link: ""))
//    }
//}
