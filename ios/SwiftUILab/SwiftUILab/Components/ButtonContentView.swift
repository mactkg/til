import SwiftUI

struct ButtonContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            /// シンプルなボタン。
            /// .padding で余白が追加できる。
            Button("Simple Button") {
                print("Simple Button tapped")
            }
            .padding()

            /// ボタンの意味をdestructive(破壊的)なことを示す。
            /// .border で枠線を追加できる。
            Button("Destructive", role: .destructive) {
                print("Destructive button tapped")
            }
            .padding()
            .border(.myBrown, width: 4)

            /// .clipShapeで形を指定できる。
            /// RoundedRectangleは角が丸い長方形。
            /// デフォルトで備えられているShapeは https://developer.apple.com/documentation/swiftui/shape#conforming-types をみると良い。
            Button("Rounded") {
                print("Rounded button tapped")
            }
            .padding()
            .foregroundStyle(.myBlack)
            .background(.myPink)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            /// frameを使えば、ボタンのサイズを指定できる。
            Button("FrameDemo") {
                print("Frame button tapped")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(.myBlack)
            .background(.myBrown)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            /// Clock.app 風のスタートボタン
            Button("Start") {
                print("Start button tapped")
            }
            .padding(32)
            .foregroundStyle(Color(red: 48/255, green: 209/255, blue: 88/255))
            .background(Color(red: 9/255, green: 42/255, blue: 17/255))
            .fontWeight(.medium)
            .clipShape(Circle())

        }
        .padding(8)
    }
}

#Preview {
    ButtonContentView()
}
