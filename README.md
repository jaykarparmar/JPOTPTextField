# JPOTPTextField

OTPView is a SwiftUI component designed to handle One-Time Password (OTP) input. It supports two styles: box and bottom line. The component is highly customizable, allowing you to set various properties such as text color, indicator colors, background colors, and more.

# Usage

To use OTPView, simply include it in your SwiftUI view and bind it to a state variable that will hold the OTP value.

```
@State private var otp: String = ""

var body: some View {
    OTPView(
        otp: $otp,
        otpCount: 6,
        cornerRadius: 10.0,
        textColor: .white,
        inactiveIndicatorColor: .gray,
        activeIndicatorColor: .green,
        inactiveBackgroundColor: .black,
        activeBackgroundColor: .blue,
        maxOTPFieldWidth: 50.0,
        inactiveIndicatorSize: 1.0,
        activeIndicatorSize: 2.0,
        otpStyle: .bottomLine
    )
}
```

# Video
https://github.com/user-attachments/assets/0cdd08a4-01e9-41fa-a518-5ea9919ae6f1



