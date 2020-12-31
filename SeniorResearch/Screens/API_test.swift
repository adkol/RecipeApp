//
//  API_test.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 10/27/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

struct API_test: View {
    @State var results = [Result]()
    @State var loaded=false
        func loadData() ->Bool{
         
         print("loading")
         guard let url = URL(string: "https://senior-research-akoll.sites.tjhsst.edu/") else {
             print("Invalid URL")
             return false
         }
         let request = URLRequest(url: url)
         let semaphore = DispatchSemaphore(value: 0)
            let toret=true
         URLSession.shared.dataTask(with: request) { data, response, error in
             if let data = data {
                 print("success")
                 print(data)
                 if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                     // we have good data – go back to the main thread
                 //    DispatchQueue.main.async {
                         // update our UI
                        print("Success")
                         self.results = decodedResponse.results
                    self.loaded=true
//                     }

                     // everything is good, so we can exit
                   
                 }
             }

             // if we're still here it means there was a problem
             print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            semaphore.signal()
         }.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
            print(self.results.count)
            return toret
     }
   
    var body: some View {
        ZStack{
            StyleData.faintYellow.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Retrieving Recipes...")
            
            
        }
        .onAppear(perform:
            {
                self.loadData()
                print(self.results.count)
        })
            if(self.loaded){
            recipe_transition(results: self.results)
            }
        }
    }
}

struct API_test_Previews: PreviewProvider {
    static var previews: some View {
        API_test()
    }
}


