//
//  OTPView.swift
//  OTPView
//
//  Created by Jaykar Parmar on 20/07/24.
//

import Foundation
import SwiftUI

struct OTPView: View {
    
    enum eOTPStyle {
        case box
        case bottomLine
    }
    
    @Binding var otp: String?
    var otpCount = 4
    var cornerRadius = 8.0
    var textColor = Color.black
    var inactiveIndicatorColor: Color = .gray
    var activeIndicatorColor: Color = .blue
    var inactiveBackgroundColor: Color = .gray
    var activeBackgroundColor: Color = .blue
    var maxOTPFieldWidth = 75.0
    var inactiveIndicatorSize = 2.0
    var activeIndicatorSize = 3.0
    var otpStyle: eOTPStyle = .box
    
    @FocusState private var focusedField: Int?
    @State private var otpDigits: [String] = []
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<self.otpCount, id: \.self) { index in
                if index != 0 {
                    Spacer()
                }
                if otpDigits.count > 0 {
                    VStack(spacing: 0) {
                        Group {
                            if otpStyle == .bottomLine {
                                TextField("*", text: $otpDigits[index])
                                    .font(.title.bold())
                                    .foregroundStyle(self.textColor)
                                    .frame(maxWidth: maxOTPFieldWidth, maxHeight: 50)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .textContentType(.oneTimeCode)
                                    .focused($focusedField, equals: index)
                                
                                Rectangle()
                                    .frame(maxWidth: maxOTPFieldWidth, maxHeight: (focusedField == index ? activeIndicatorSize : inactiveIndicatorSize))
                                    .foregroundStyle((focusedField == index ? activeIndicatorColor : inactiveIndicatorColor))
                            }
                            else {
                                TextField("*", text: $otpDigits[index])
                                    .font(.title.bold())
                                    .foregroundStyle(self.textColor)
                                    .frame(maxWidth: maxOTPFieldWidth, maxHeight: 50)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .textContentType(.oneTimeCode)
                                    .focused($focusedField, equals: index)
                                    .background((focusedField == index ? activeBackgroundColor : inactiveBackgroundColor))
                                    .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
                                    .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke((focusedField == index ? activeIndicatorColor : inactiveIndicatorColor), lineWidth: (focusedField == index ? activeIndicatorSize : inactiveIndicatorSize))
                                                )
                            }
                        }
                        .onChange(of: self.otpDigits[index]) { newValue in
                            if newValue.count == 1 {
                                if index < otpCount - 1 {
                                    focusedField = index + 1
                                } else {
                                    focusedField = nil
                                }
                            }
                            else if newValue.count > 1 {
                                self.otpDigits[index] = String(newValue.suffix(1))
                            }
                            else if newValue.isEmpty {
                                if index > 0 {
                                    focusedField = index - 1
                                }
                            }
                            self.otp = self.otpDigits.joined(separator: "")
                        }
                    }
                }
                if index != otpCount - 1 {
                    Spacer()
                }
            }
        }
        
        .onAppear(perform: {
            self.setupView()
        })
    }
}

extension OTPView {
    private func setupView() {
        self.otpDigits = Array(repeating: "", count: self.otpCount)
        self.focusedField = 0
    }
}

#Preview {
    OTPView(otp: .constant(""))
}
