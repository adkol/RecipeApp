//
//  recipe_transition.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/2/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct recipe_transition: View {

    @State var size : CGFloat = UIScreen.main.bounds.height
    @State var sizes=[UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height,UIScreen.main.bounds.height]
    @State var currIndex=0
    @State var results:[Result]
    @State var onParent=true
    
    var body: some View {
        ZStack{
//            Text("")
//                .onAppear {
//                    print("EmptyView here")
//                    self.loadData()
//            }
            home().offset(y:self.size-UIScreen.main.bounds.height)
                    //next_recipe(info: self.results[self.currIndex])
            .gesture(DragGesture()
                    .onChanged({value in
                        if(self.onParent)
                        {
                          
                        let temp = UIScreen.main.bounds.height
                        self.sizes[0] = temp + value.translation.height
                        }

                    })
                    .onEnded({value in
                          print(self.results.count)
                        if(self.onParent)
                              {
             

                        if value.translation.height > 0{

                            if value.translation.height > 200{

                                self.sizes[0] = UIScreen.main.bounds.height
                                self.currIndex += -1


                            }
                            else{

                                self.sizes[0] = 0
                                //self.currIndex += 1


                            }
                        }
                        else{
                            if value.translation.height < -200{

                                self.sizes[0] = 0
                                self.currIndex += 1
                              
                                print(self.currIndex)
                            }
                            else{

                                self.sizes[0] = UIScreen.main.bounds.height
                               // self.currIndex += -1

                            }
                        }
                        }
                    })

                )
                    .animation(.spring())
        ForEach(0..<self.results.count) { i in
            self.next_recipe(info: self.results[i]).offset(y:self.sizes[i])
            .gesture(DragGesture()
                    .onChanged({value in
                        if(self.onParent)
                              {
                        print(value)
                        print("Changing...")
                        let temp = UIScreen.main.bounds.height
                        if(value.translation.height<0){
                        self.sizes[i+1] = temp + value.translation.height
                        }
                        else
                        {
                            self.sizes[i] = self.sizes[i] + value.translation.height
                        }
                        }
                    })
                    .onEnded({value in
                        if(self.onParent)
                              {
                        print("ended")

                        if value.translation.height > 0{
                            
                            if value.translation.height > 200{
                                
                                 self.sizes[i-1] = 0
                                self.sizes[i]=UIScreen.main.bounds.height
                                self.currIndex += -1
                                print("Went back to previous recipe")
                                print(self.currIndex)
                                
                            }
                            else{
                                
                                self.sizes[i+1] = 0
                                //self.currIndex += 1
                                

                            }
                        }
                        else{
                            if value.translation.height < -200{
                                                     
                                self.sizes[i+1] = 0
                                self.currIndex += 1
                                print("Went to the next recipe")
                                print(self.currIndex)
                            }
                            else{
                                                     
                                self.sizes[i+1] = UIScreen.main.bounds.height
                               // self.currIndex += -1
                                
                            }
                        }
                        }
                    })
            
                )
//                next_recipe(info: self.results[self.currIndex]).offset(y:self.size)
            }
        
        }
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)

        
        
    }
    func next_recipe(info: Result) -> recipe_view
    {
        return recipe_view(title: info.Title, ingredients: info.Ingredients, instructions: info.Instructions, image_link: info.Image, container: self)
    }
    func loadData(){
         
         print("loading")
         guard let url = URL(string: "https://senior-research-akoll.sites.tjhsst.edu/") else {
             print("Invalid URL")
             return
         }
         let request = URLRequest(url: url)
         URLSession.shared.dataTask(with: request) { data, response, error in
             if let data = data {
                 print("success")
                 print(data)
                 if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                     // we have good data – go back to the main thread
                     DispatchQueue.main.async {
                         // update our UI
                         self.results = decodedResponse.results
                     }

                     // everything is good, so we can exit
                     return
                 }
             }

             // if we're still here it means there was a problem
             print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
         }.resume()
     }
    
  
}

//func next_recipe(info: Result) -> recipe_view
//{
//    return recipe_view(title: info.Title, ingredients: info.Ingredients, instructions: info.Instructions, image_link: info.Image)
//}
struct recipe_transition_Previews: PreviewProvider {
    static var previews: some View {
        recipe_transition(results: [Result(Title: "Butternut Squash Soup", time: 0, Yields: "9", Ingredients: ["6 slices bacon, cut crosswise into ½-inch pieces","2 celery ribs, chopped","1 carrot, chopped","1 medium onion, chopped","¼ teaspoon cinnamon","¾ pound boiling potatoes","2 medium Granny Smith apples (about ¾ pound total)","1 ½ pounds butternut squash, peeled, seeded, and cut into ½-inch pieces (3½ to 4 cups)","2 cups reduced-sodium chicken stock or broth","2 to 2½ cups water","Sour cream"], Instructions: "Cook bacon in a 6-quart heavy pot over medium heat, stirring occasionally, until crisp, then transfer with a slotted spoon to paper towels to drain, reserving 2 tablespoons fat in pot. (Add vegetable oil if your bacon is very lean and doesn't yield enough fat.)Cook celery, carrot, and onion in fat in pot over low heat, covered, stirring occasionally, until softened but not browned, 10 to 12 minutes. Add cinnamon and cook, uncovered, stirring, 1 minute.While vegetables are cooking, peel potatoes and coarsely chop. Peel and core 1 apple and coarsely chop.Stir squash, potato, chopped apple, stock, 2 cups water, 1 teaspoon salt and 1/2 teaspoon pepper into onion mixture, then simmer, uncovered, stirring occasionally, until vegetables are very tender, 15 to 20 minutes.Puree soup in 4 batches in a blender (use caution when blending hot liquids), then heat in cleaned pot over medium low heat, stirring occasionally. (Add additional 1/2 cup water to thin, if necessary.)While soup is heating, cut enough of remaining apple into thin matchsticks (about 1 1/2-inches long) to measure about 1/2 cup.Serve soup topped with sour cream, bacon, and apple matchsticks.Cooks' Notes: Soup can be made 2 days ahead and chilled, covered once cooled. Cooked bacon can be kept refrigerated in an airtight container—reheat in a 375°F oven in a small baking pan.", Image: "https://assets.epicurious.com/photos/5c5a01d994580c2d4b9d4b11/6:4/w_274%2Ch_169/Butternut-Squash-%26-Apple-Soup-31012019.jpg"),Result(Title: "Caesar Salad Roast Chicken", time: 0, Yields: "4", Ingredients:["8 anchovies, mashed to a paste","8 garlic cloves, finely grated","6 Tbsp. mayonnaise, divided","1 Tbsp. Dijon mustard, plus more for serving","2 Tbsp. extra-virgin olive oil, divided","1½ tsp. freshly ground black pepper, plus more","1 (3½–4-lb.) whole chicken or 4 chicken legs (thigh and drumstick; about 3 lb.)","Kosher salt","8 medium shallots, unpeeled, halved lengthwise","2 lemons, divided","1 oz. Parmesan, finely grated","4 oz. country-style bread, torn into (1½\") pieces","2 romaine hearts, leaves separated, torn"],Instructions:"Place a rack in lower third of oven; preheat to 450°F. Whisk anchovies, garlic, 3 Tbsp. mayonnaise, 1 Tbsp. mustard, 1 Tbsp. oil, and 1½ tsp. pepper in a small bowl. Set aside 1 Tbsp. anchovy mayo in another small bowl.Pat chicken dry; season outside and inside all over with salt. Arrange breast side up in a cast-iron skillet and tuck wings underneath. Arrange shallots around (if using legs, nestle under and around); season with salt and pepper. Brush remaining anchovy mayo all over chicken, making sure to get it into the nooks and crannies, then brush shallots with any leftover anchovy mayo.Place chicken in oven so legs are facing toward the back (this is the hottest part of the oven and will help the legs cook before the breast dries out) and roast until some anchovy mayo and fat begin to drip onto shallots, about 15 minutes. Remove from oven and, using tongs, turn shallots to coat in drippings. Return skillet to oven and continue to roast chicken, stirring shallots once or twice, until golden brown and an instant-read thermometer inserted into the thickest part of breast registers 155°F, 45–55 minutes. If skin starts to get too dark on the top before chicken is done, tent area with foil, leaving the rest of the bird exposed. If using chicken legs, start checking at 40 minutes (a thermometer inserted right at the joint should register 160°F). Transfer chicken and shallots to a cutting board, leaving behind any juices and fat in skillet. If shallots need more time to soften and darken, roast a bit longer without chicken before proceeding. Reserve skillet.Reduce oven temperature to 400°F. Finely grate half of zest of 1 lemon into a large bowl; cut lemon in half and squeeze in juice. Add reserved 1 Tbsp. anchovy mayo, remaining 3 Tbsp. mayo, and remaining 1 Tbsp. oil and whisk to combine, then stir in Parmesan. Season with salt and pepper. Set dressing aside.Add bread to reserved skillet with fat and turn to coat. Return skillet to oven and toast bread, tossing halfway through, until golden brown and crisp, 12–15 minutes. Transfer croutons to bowl with reserved dressing. Add romaine and gently toss until lettuce is well coated. Season salad with salt and pepper.Slice remaining lemon into wedges. Carve chicken and nestle back into skillet or transfer to a platter; arrange shallots and lemon wedges around. Serve with salad and more mustard alongside.", Image: "https://assets.epicurious.com/photos/5f8e0436eb27e3e71e94dd98/6:4/w_274%2Ch_169/caesar-salad-roast-chicken-recipe-BA-101920.jpg"),Result(Title: "", time: 0, Yields: "", Ingredients: [""], Instructions: "", Image: "")])
    }
}
