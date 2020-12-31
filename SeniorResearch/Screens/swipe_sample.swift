//
//  swipe_sample.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 11/28/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

//import SwiftUI
//
//struct swipe_sample: View {
//    
//    // increase size until ur satisfaction
//    
//    
//    @State var size : CGFloat = UIScreen.main.bounds.height - 130
//    
//    var body: some View {
//        
//        
//        ZStack{
//            
//            Color.orange
//            
//            recipe_view(title: "", ingredients: [""], instructions: "", image_link: "").offset(y: size+100)
////            .gesture(DragGesture()
////                .onChanged({ (value) in
////
////                    if value.translation.height > 0{
////
////                        self.size = value.translation.height
////                    }
////                    else{
////
////                        let temp = UIScreen.main.bounds.height - 130
////                        self.size = temp + value.translation.height
////
////                        // in up wards value will be negative so we subtracting the value one by one from bottom
////                    }
////                })
////                .onEnded({ (value) in
////
////                    if value.translation.height > 0{
////
////                        if value.translation.height > 200{
////
////                            self.size = UIScreen.main.bounds.height - 130
////                        }
////                        else{
////
////                            self.size = 15
////                        }
////                    }
////                    else{
////
////                        //since in negative lower value will be greater...
////
////                        if value.translation.height < -200{
////
////                            self.size = 15
////                        }
////                        else{
////
////                            self.size = UIScreen.main.bounds.height - 130
////                        }
////                    }
////
////                })).animation(.spring())
//            
//            // animation for drag
//        }
//    }
//}
//
//struct swipe_sample_Previews: PreviewProvider {
//    static var previews: some View {
//       swipe_sample()
//    }
//}
//
//struct swipe : View {
//    
//    var body : some View{
//        
//        VStack{
//            
//            // for pushing view up / down
//            VStack{
//                
//                //top+ bottom 30 so aprox height - 100
//                Text("Swipe up to See More").fontWeight(.heavy).padding([.top,.bottom],15)
//            }
//           
//            
//            // your custom view here....
//            HStack{
//                
//                Spacer()
//                Text("hello top").fontWeight(.heavy).padding()
//            }
//            
//            Spacer()
//            Text("hello bottom").fontWeight(.heavy).padding()
//        }.background(Color.white)
//    }
//}
      
