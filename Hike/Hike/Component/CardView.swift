//
//  CardView.swift
//  Hike
//
//  Created by Prannvat Singh on 29/09/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - FUNCTIONS
    func randomImage() {
        
        while imageNumber == randomNumber {
            randomNumber = Int.random(in: 1...5)
        }
        imageNumber = randomNumber
    }
    
    
    var body: some View {
        //MARK: - CARD
        ZStack {
            
            CustomBackgroundView()
            VStack {
                
                // MARK: - HEADER
                
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 50))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                .customGrayLight,
                                .customGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom
                                )
                        )
                        
                        Spacer()
                            .frame(width: 40)
                        Button {
                            //ACTION: Show a Sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                             
                        }  label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                        
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family!")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                Spacer()
                    .frame(height: 40)
                
                
                
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 256, height: 256)
                        .animation(.easeOut(duration: 0.5),
                                   value : imageNumber
                            )
                        
                        
                }
                Spacer().frame(height: 30)
                
                // MARK: - FOOTER
                
                Button {
                    // ACTION: Generate a random number
                    print("The number was pressed.")
                    randomImage()
                } label : {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                .customGreenLight,
                                .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
                
                
                //: ZSTACK
            }
        } //: CARD
        .frame(width: 350, height: 600)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
