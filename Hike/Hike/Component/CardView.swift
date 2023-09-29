//
//  CardView.swift
//  Hike
//
//  Created by Prannvat Singh on 29/09/2023.
//

import SwiftUI

struct CardView: View {
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
                        Button {
                            //ACTION: Show a Sheet
                            print("The button was pressed.")
                        }  label: {
                            CustomButtonView()
                            }
                        
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family!")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                    Circle()
                        .fill(
                        LinearGradient(
                            colors: [
                                Color("ColorIndigoMedium"),
                                Color ("ColorSalmonLight")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                                )
                            )
                        .frame(width:256, height: 256)
                    Image("image-1")
                        .resizable()
                    .scaledToFit()
                }
                
                // MARK: - FOOTER
                //: VSTACK
            }
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
