//
//  ContentView.swift
//  JPOTPTextField
//
//  Created by Jaykar Parmar on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var otp: String?
    
    var body: some View {
        VStack(spacing: 40) {
            Text("SwiftUI\nOTP Textfield")
                .multilineTextAlignment(.center)
                .font(.title.bold())
            
            OTPView(
                otp: $otp,
                otpCount: 4,
                cornerRadius: 12,
                inactiveIndicatorColor: .gray.opacity(0.5),
                activeIndicatorColor: .blue,
                inactiveBackgroundColor: .gray.opacity(0.2),
                activeBackgroundColor: .blue.opacity(0.1),
                maxOTPFieldWidth: 80,
                inactiveIndicatorSize: 1,
                activeIndicatorSize: 2,
                otpStyle: .box
            )
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
