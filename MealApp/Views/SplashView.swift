//
//  SplashView.swift
//  MealApp
//
//  Created by Shreya Singh on 1/15/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            HomeView()
        } else {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack{
                    Image(systemName: "fork.knife.circle")
                        .font(.system(size: 130))
                        .foregroundStyle(.white)
                        .padding(.all)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.0)) {
                        size = 1.5
                        opacity = 0.7
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
                    isActive = true
                }
            }
        }
    }
}
