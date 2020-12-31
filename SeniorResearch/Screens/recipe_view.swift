//
//  recipe_view.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 11/5/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct recipe_view: View {
    @State var title:String;
    @State var ingredients:[String];
    @State var instructions:String;
    @State var image_link:String;
    @State var change_screen=false
    @State var size : CGFloat = UIScreen.main.bounds.width
    @State var container:recipe_transition
    var body: some View {

        ZStack{
            StyleData.faintYellow.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0.0){
                Spacer()
            
                
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
        
                    .background(Rectangle().fill(Color.orange).frame(width:1000))
            

               // Spacer()
//        Image(uiImage:load_image(url: "https://assets.epicurious.com/photos/5c5a01d994580c2d4b9d4b11/6:4/w_274%2Ch_169/Butternut-Squash-%26-Apple-Soup-31012019.jpg"))
                 ZStack
                    {
                     Image(uiImage:load_image(url: image_link))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 5)
                        Button(action: {self.change_screen.toggle()
                            self.size=0
                            self.container.onParent=false
                        }){
                            
                            Text("")
                                .frame(width: 300, height: 200.0)
                              
                        }
                        .opacity(1)

                    
                }
                
                Spacer()
            }
                    HStack{

                        Spacer()
                        Spacer()
                    }
                    recipe_detail(title: self.title, time: 0, ingredients: self.ingredients, Instructions: self.instructions, image: Image(uiImage:load_image(url: "https://assets.epicurious.com/photos/5f89c7d7819b886aba0a2804/6:4/w_274%2Ch_169/chicken-and-rice-with-leeks-and-salsa-verde-recipe-BA-101620.jpg")), container: self)
                        .transition(.moveAndFade)
                        .offset(x: self.size)
                    
                
            

        }
        
    

    }
    
}
 func load_image(url:String) ->UIImage
{
    var temp=UIImageView();
    temp.load(url_name: url);
    let height=temp.image!.size.height;
    let width=temp.image!.size.width;
    let screenSize: CGRect = UIScreen.main.bounds;
    let screenWidth=screenSize.width;
    let screenHeight=screenSize.height;
//    if (height/screenHeight>width/screenWidth)
//    {
//        temp.image!.scale=height/screenHeight;
//    }
    return temp.image!;

}
extension UIImageView {
    func load(url_name: String) {
        guard let url = URL(string: url_name)
        else{
            print("Failed")
            return;}
        //DispatchQueue.global().sync{[weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    print("Success at 45");
                    //DispatchQueue.main.sync {
                        self.image = image
                    //}
                }
                else{
                    print("Fails at 50");
                }
            }
            else{
                print("Fails at 55");
            }
        }
    //}
}
//struct recipe_view_Previews: PreviewProvider {
//    static var previews: some View {
//        recipe_view()
//    }
//}
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


//struct recipe_view_Previews: PreviewProvider {
//    static var previews: some View {
//        recipe_view(title: "", ingredients: [""], instructions: "", image_link: "", container:         recipe_transition(results: [Result(Title: "Butternut Squash Soup", time: 0, Yields: "9", Ingredients: ["6 slices bacon, cut crosswise into ½-inch pieces","2 celery ribs, chopped","1 carrot, chopped","1 medium onion, chopped","¼ teaspoon cinnamon","¾ pound boiling potatoes","2 medium Granny Smith apples (about ¾ pound total)","1 ½ pounds butternut squash, peeled, seeded, and cut into ½-inch pieces (3½ to 4 cups)","2 cups reduced-sodium chicken stock or broth","2 to 2½ cups water","Sour cream"], Instructions: "Cook bacon in a 6-quart heavy pot over medium heat, stirring occasionally, until crisp, then transfer with a slotted spoon to paper towels to drain, reserving 2 tablespoons fat in pot. (Add vegetable oil if your bacon is very lean and doesn't yield enough fat.)Cook celery, carrot, and onion in fat in pot over low heat, covered, stirring occasionally, until softened but not browned, 10 to 12 minutes. Add cinnamon and cook, uncovered, stirring, 1 minute.While vegetables are cooking, peel potatoes and coarsely chop. Peel and core 1 apple and coarsely chop.Stir squash, potato, chopped apple, stock, 2 cups water, 1 teaspoon salt and 1/2 teaspoon pepper into onion mixture, then simmer, uncovered, stirring occasionally, until vegetables are very tender, 15 to 20 minutes.Puree soup in 4 batches in a blender (use caution when blending hot liquids), then heat in cleaned pot over medium low heat, stirring occasionally. (Add additional 1/2 cup water to thin, if necessary.)While soup is heating, cut enough of remaining apple into thin matchsticks (about 1 1/2-inches long) to measure about 1/2 cup.Serve soup topped with sour cream, bacon, and apple matchsticks.Cooks' Notes: Soup can be made 2 days ahead and chilled, covered once cooled. Cooked bacon can be kept refrigerated in an airtight container—reheat in a 375°F oven in a small baking pan.", Image: "https://assets.epicurious.com/photos/5c5a01d994580c2d4b9d4b11/6:4/w_274%2Ch_169/Butternut-Squash-%26-Apple-Soup-31012019.jpg"),Result(Title: "Caesar Salad Roast Chicken", time: 0, Yields: "4", Ingredients:["8 anchovies, mashed to a paste","8 garlic cloves, finely grated","6 Tbsp. mayonnaise, divided","1 Tbsp. Dijon mustard, plus more for serving","2 Tbsp. extra-virgin olive oil, divided","1½ tsp. freshly ground black pepper, plus more","1 (3½–4-lb.) whole chicken or 4 chicken legs (thigh and drumstick; about 3 lb.)","Kosher salt","8 medium shallots, unpeeled, halved lengthwise","2 lemons, divided","1 oz. Parmesan, finely grated","4 oz. country-style bread, torn into (1½\") pieces","2 romaine hearts, leaves separated, torn"],Instructions:"Place a rack in lower third of oven; preheat to 450°F. Whisk anchovies, garlic, 3 Tbsp. mayonnaise, 1 Tbsp. mustard, 1 Tbsp. oil, and 1½ tsp. pepper in a small bowl. Set aside 1 Tbsp. anchovy mayo in another small bowl.Pat chicken dry; season outside and inside all over with salt. Arrange breast side up in a cast-iron skillet and tuck wings underneath. Arrange shallots around (if using legs, nestle under and around); season with salt and pepper. Brush remaining anchovy mayo all over chicken, making sure to get it into the nooks and crannies, then brush shallots with any leftover anchovy mayo.Place chicken in oven so legs are facing toward the back (this is the hottest part of the oven and will help the legs cook before the breast dries out) and roast until some anchovy mayo and fat begin to drip onto shallots, about 15 minutes. Remove from oven and, using tongs, turn shallots to coat in drippings. Return skillet to oven and continue to roast chicken, stirring shallots once or twice, until golden brown and an instant-read thermometer inserted into the thickest part of breast registers 155°F, 45–55 minutes. If skin starts to get too dark on the top before chicken is done, tent area with foil, leaving the rest of the bird exposed. If using chicken legs, start checking at 40 minutes (a thermometer inserted right at the joint should register 160°F). Transfer chicken and shallots to a cutting board, leaving behind any juices and fat in skillet. If shallots need more time to soften and darken, roast a bit longer without chicken before proceeding. Reserve skillet.Reduce oven temperature to 400°F. Finely grate half of zest of 1 lemon into a large bowl; cut lemon in half and squeeze in juice. Add reserved 1 Tbsp. anchovy mayo, remaining 3 Tbsp. mayo, and remaining 1 Tbsp. oil and whisk to combine, then stir in Parmesan. Season with salt and pepper. Set dressing aside.Add bread to reserved skillet with fat and turn to coat. Return skillet to oven and toast bread, tossing halfway through, until golden brown and crisp, 12–15 minutes. Transfer croutons to bowl with reserved dressing. Add romaine and gently toss until lettuce is well coated. Season salad with salt and pepper.Slice remaining lemon into wedges. Carve chicken and nestle back into skillet or transfer to a platter; arrange shallots and lemon wedges around. Serve with salad and more mustard alongside.", Image: "https://assets.epicurious.com/photos/5f8e0436eb27e3e71e94dd98/6:4/w_274%2Ch_169/caesar-salad-roast-chicken-recipe-BA-101920.jpg"),Result(Title: "", time: 0, Yields: "", Ingredients: [""], Instructions: "", Image: "")]))
//    }
//}
